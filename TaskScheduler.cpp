#include "TaskScheduler.h"
#include <chrono>

TaskScheduler::TaskScheduler(size_t numThreads, SchedulingPolicy policy, int timeQuantum)
    : stop(false), activeThreads(0), policy(policy), timeQuantum(timeQuantum) {
    scaleThreads(numThreads);
}

TaskScheduler::~TaskScheduler() {
    {
        std::lock_guard<std::mutex> lock(queueMutex);
        stop = true;
    }
    cv.notify_all();
    for (std::thread &worker : workers)
        worker.join();
}

void TaskScheduler::submitTask(const Task& task) {
    Task t = task;
    t.submitTime = std::chrono::high_resolution_clock::now();
    std::lock_guard<std::mutex> lock(queueMutex);
    if (policy == SchedulingPolicy::FIFO) 
        fifoQueue.push(t);
    else if (policy == SchedulingPolicy::ROUND_ROBIN) 
        rrQueue.push(t);
    else 
        priorityQueue.push(t);
    cv.notify_one();
}

std::future<Result> TaskScheduler::submitTaskWithResult(const Task& task) {
    std::promise<Result> promise;
    auto future = promise.get_future();
    Task t = task;
    t.submitTime = std::chrono::high_resolution_clock::now();
    {
        std::lock_guard<std::mutex> lock(queueMutex);
        promises[task.taskId] = std::move(promise);
        if (policy == SchedulingPolicy::FIFO) 
            fifoQueue.push(t);
        else if (policy == SchedulingPolicy::ROUND_ROBIN) 
            rrQueue.push(t);
        else 
            priorityQueue.push(t);
    }
    cv.notify_one();
    return future;
}

void TaskScheduler::scaleThreads(size_t numThreads) {
    while (workers.size() < numThreads)
        workers.emplace_back(&TaskScheduler::workerThread, this);
    while (workers.size() > numThreads) {
        workers.back().detach();
        workers.pop_back();
    }
}

std::vector<Result> TaskScheduler::getResults() {
    std::lock_guard<std::mutex> lock(queueMutex);
    return results;
}

void TaskScheduler::cancelTask(int taskId) {
    std::lock_guard<std::mutex> lock(queueMutex);
    canceledTasks.insert(taskId);
}

void TaskScheduler::workerThread() {
    while (true) {
        Task task;
        {
            std::unique_lock<std::mutex> lock(queueMutex);
            cv.wait(lock, [this] { 
                return stop || !fifoQueue.empty() || !rrQueue.empty() || !priorityQueue.empty(); 
            });
            if (stop && fifoQueue.empty() && rrQueue.empty() && priorityQueue.empty())
                return;

            if (policy == SchedulingPolicy::FIFO) {
                task = fifoQueue.front();
                fifoQueue.pop();
            } else if (policy == SchedulingPolicy::ROUND_ROBIN) {
                task = rrQueue.front();
                rrQueue.pop();
            } else { // PRIORITY
                task = priorityQueue.top();
                priorityQueue.pop();
            }
            ++activeThreads;
        }

        if (canceledTasks.find(task.taskId) != canceledTasks.end()) {
            std::lock_guard<std::mutex> lock(queueMutex);
            if (promises.find(task.taskId) != promises.end()) {
                promises[task.taskId].set_value(Result{task.taskId, "Canceled", nullptr, 0});
                promises.erase(task.taskId);
            }
            --activeThreads;
            continue;
        }

        // --- Run Task ---
        Result result{task.taskId, "", nullptr, 0};
        try {
            task.func();
            result.output = "Completed";
        } catch (...) {
            result.exception = std::current_exception();
        }
        auto end = std::chrono::high_resolution_clock::now();
        result.turnaroundTime = 
            std::chrono::duration_cast<std::chrono::milliseconds>(end - task.submitTime).count();
        // ----------------

        {
            std::lock_guard<std::mutex> lock(queueMutex);
            results.push_back(result);
            if (promises.find(task.taskId) != promises.end()) {
                promises[task.taskId].set_value(result);
                promises.erase(task.taskId);
            }
            --activeThreads;
        }
    }
}
