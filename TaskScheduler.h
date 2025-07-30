#pragma once
#include <iostream>
#include <vector>
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>
#include <functional>
#include <future>
#include <unordered_map>
#include <unordered_set>
#include <atomic>

struct Task {
    std::function<void()> func;
    int taskId;
    int priority;
    int burstTime;
    std::chrono::high_resolution_clock::time_point submitTime;
};


struct Result {
    int taskId;
    std::string output;
    std::exception_ptr exception;
    int waitingTime;
    int turnaroundTime;
};

enum class SchedulingPolicy { FIFO, ROUND_ROBIN, PRIORITY };

struct CompareTask {
    bool operator()(const Task& t1, const Task& t2) {
        return t1.priority < t2.priority;
    }
};

class TaskScheduler {
public:
    TaskScheduler(size_t numThreads, SchedulingPolicy policy, int timeQuantum = 100);
    ~TaskScheduler();
    void submitTask(const Task& task);
    std::future<Result> submitTaskWithResult(const Task& task);
    void scaleThreads(size_t numThreads);
    std::vector<Result> getResults();
    void cancelTask(int taskId);

private:
    void workerThread();
    SchedulingPolicy policy;
    int timeQuantum;

    std::vector<std::thread> workers;
    std::queue<Task> fifoQueue;
    std::queue<Task> rrQueue;
    std::priority_queue<Task, std::vector<Task>, CompareTask> priorityQueue;

    std::unordered_map<int, std::promise<Result>> promises;
    std::unordered_set<int> canceledTasks;
    std::vector<Result> results;
    std::mutex queueMutex;
    std::condition_variable cv;
    std::atomic<bool> stop;
    std::atomic<size_t> activeThreads;
};
