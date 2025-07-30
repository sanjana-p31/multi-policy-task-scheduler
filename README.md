# Multi-Policy Concurrent Task Scheduler

A multi-threaded task scheduling system implemented in **C++17**, supporting three classic scheduling algorithms:
- **FIFO (First In, First Out)**
- **Round Robin**
- **Priority Scheduling**

The project also provides a **comparative analysis** of turnaround times across different scheduling policies, showcasing performance differences.

---

## Features
- **Multi-threaded execution** using a thread pool.
- **Support for three scheduling policies**:
  - FIFO
  - Round Robin (with configurable time quantum)
  - Priority-based scheduling
- **Task cancellation support**
- **Performance metrics** (turnaround time per task and average turnaround time per policy)
- **Verbose mode** for detailed per-task execution logs.

---

## Tech Stack
- **Language:** C++17
- **Concurrency:** `std::thread`, `std::mutex`, `std::condition_variable`, `std::future`
- **Build System:** CMake

---

## Directory Structure
project-root/
│── CMakeLists.txt
│── include/
│ └── TaskScheduler.h
│── src/
│ └── TaskScheduler.cpp
│── main.cpp
│── README.md


---

## Build & Run
### **Requirements**
- CMake (>= 3.10)
- g++ or clang++ with C++17 support

### **Steps**
```bash
# Clone the repo
git clone https://github.com/<your-username>/task-scheduler.git
cd task-scheduler

# Create build directory
mkdir build && cd build

# Build
cmake ..
make

# Run
./task_scheduler            # default mode
./task_scheduler --verbose  # verbose mode
