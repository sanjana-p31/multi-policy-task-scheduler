#include "TaskScheduler.h"
#include <random>
#include <chrono>

std::vector<Task> generateTasks(int n) {
    std::vector<Task> tasks;
    for (int i = 0; i < n; ++i) {
        int burst = (rand() % 200) + 50;
        tasks.push_back({[burst]() { std::this_thread::sleep_for(std::chrono::milliseconds(burst)); }, i, rand()%5, burst});
    }
    return tasks;
}

void runAnalysis(SchedulingPolicy policy, bool verbose) {
    TaskScheduler scheduler(4, policy, 100);
    auto tasks = generateTasks(10);

    if (verbose)
        std::cout << "\n--- Running " 
                  << (policy == SchedulingPolicy::FIFO ? "FIFO" :
                      policy == SchedulingPolicy::ROUND_ROBIN ? "Round Robin" : "Priority")
                  << " ---\n";

    std::vector<std::future<Result>> futures;
    for (auto &task : tasks)
        futures.push_back(scheduler.submitTaskWithResult(task));

    for (auto &f : futures) {
        auto result = f.get();
        if (verbose)
            std::cout << "Task " << result.taskId << " -> "
                      << result.output << " (Turnaround=" 
                      << result.turnaroundTime << "ms)\n";
    }

    auto results = scheduler.getResults();
    int totalTAT = 0;
    for (auto &r : results) totalTAT += r.turnaroundTime;

    std::cout << "Policy: "
              << (policy == SchedulingPolicy::FIFO ? "FIFO" :
                  policy == SchedulingPolicy::ROUND_ROBIN ? "RR" : "PRIORITY")
              << " Avg TAT: " << totalTAT / results.size() << " ms\n";
}



int main(int argc, char* argv[]) {
    bool verbose = false;
    for (int i = 1; i < argc; ++i) {
        if (std::string(argv[i]) == "--verbose") {
            verbose = true;
        }
    }

    srand(time(nullptr));
    runAnalysis(SchedulingPolicy::FIFO, verbose);
    runAnalysis(SchedulingPolicy::ROUND_ROBIN, verbose);
    runAnalysis(SchedulingPolicy::PRIORITY, verbose);

    return 0;
}

