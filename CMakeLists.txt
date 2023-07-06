cmake_minimum_required(VERSION 3.10)

project(MyObjectiveCProject LANGUAGES C OBJC)

set(CMAKE_MACOSX_BUNDLE YES)

add_executable(${PROJECT_NAME} MACOSX_BUNDLE main.m
  ViewA.h ViewA.m
  ViewB.h ViewB.m
  WindowController.h WindowController.m)

target_link_libraries(${PROJECT_NAME} "-framework Cocoa")

