cmake_minimum_required(VERSION 3.10)
project(OS_PROJECT_1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add include directory
include_directories(${CMAKE_SOURCE_DIR})

# Add executable
add_executable(task_scheduler 
    main.cpp 
    TaskScheduler.cpp
)
