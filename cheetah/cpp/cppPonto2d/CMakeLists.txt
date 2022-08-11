cmake_minimum_required(VERSION 3.8)
project(cppPonto2d)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_VERBOSE_MAKEFILE ON)

file(GLOB SOURCE_FILES "*.cpp")
file(GLOB HEADER_FILES "*.h")

include_directories(inc)

# your app
add_executable(cppPonto2d ${SOURCE_FILES} ${HEADER_FILES})

