# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/sanjanaprabhugari/Desktop/OS_Project_1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/sanjanaprabhugari/Desktop/OS_Project_1/build

# Include any dependencies generated for this target.
include CMakeFiles/task_scheduler.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/task_scheduler.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/task_scheduler.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/task_scheduler.dir/flags.make

CMakeFiles/task_scheduler.dir/codegen:
.PHONY : CMakeFiles/task_scheduler.dir/codegen

CMakeFiles/task_scheduler.dir/main.cpp.o: CMakeFiles/task_scheduler.dir/flags.make
CMakeFiles/task_scheduler.dir/main.cpp.o: /Users/sanjanaprabhugari/Desktop/OS_Project_1/main.cpp
CMakeFiles/task_scheduler.dir/main.cpp.o: CMakeFiles/task_scheduler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sanjanaprabhugari/Desktop/OS_Project_1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/task_scheduler.dir/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/task_scheduler.dir/main.cpp.o -MF CMakeFiles/task_scheduler.dir/main.cpp.o.d -o CMakeFiles/task_scheduler.dir/main.cpp.o -c /Users/sanjanaprabhugari/Desktop/OS_Project_1/main.cpp

CMakeFiles/task_scheduler.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/task_scheduler.dir/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sanjanaprabhugari/Desktop/OS_Project_1/main.cpp > CMakeFiles/task_scheduler.dir/main.cpp.i

CMakeFiles/task_scheduler.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/task_scheduler.dir/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sanjanaprabhugari/Desktop/OS_Project_1/main.cpp -o CMakeFiles/task_scheduler.dir/main.cpp.s

CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o: CMakeFiles/task_scheduler.dir/flags.make
CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o: /Users/sanjanaprabhugari/Desktop/OS_Project_1/TaskScheduler.cpp
CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o: CMakeFiles/task_scheduler.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/Users/sanjanaprabhugari/Desktop/OS_Project_1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o -MF CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o.d -o CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o -c /Users/sanjanaprabhugari/Desktop/OS_Project_1/TaskScheduler.cpp

CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/sanjanaprabhugari/Desktop/OS_Project_1/TaskScheduler.cpp > CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.i

CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/sanjanaprabhugari/Desktop/OS_Project_1/TaskScheduler.cpp -o CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.s

# Object files for target task_scheduler
task_scheduler_OBJECTS = \
"CMakeFiles/task_scheduler.dir/main.cpp.o" \
"CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o"

# External object files for target task_scheduler
task_scheduler_EXTERNAL_OBJECTS =

task_scheduler: CMakeFiles/task_scheduler.dir/main.cpp.o
task_scheduler: CMakeFiles/task_scheduler.dir/TaskScheduler.cpp.o
task_scheduler: CMakeFiles/task_scheduler.dir/build.make
task_scheduler: CMakeFiles/task_scheduler.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/Users/sanjanaprabhugari/Desktop/OS_Project_1/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable task_scheduler"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/task_scheduler.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/task_scheduler.dir/build: task_scheduler
.PHONY : CMakeFiles/task_scheduler.dir/build

CMakeFiles/task_scheduler.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/task_scheduler.dir/cmake_clean.cmake
.PHONY : CMakeFiles/task_scheduler.dir/clean

CMakeFiles/task_scheduler.dir/depend:
	cd /Users/sanjanaprabhugari/Desktop/OS_Project_1/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/sanjanaprabhugari/Desktop/OS_Project_1 /Users/sanjanaprabhugari/Desktop/OS_Project_1 /Users/sanjanaprabhugari/Desktop/OS_Project_1/build /Users/sanjanaprabhugari/Desktop/OS_Project_1/build /Users/sanjanaprabhugari/Desktop/OS_Project_1/build/CMakeFiles/task_scheduler.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/task_scheduler.dir/depend

