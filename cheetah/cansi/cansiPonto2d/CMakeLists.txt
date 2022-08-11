cmake_minimum_required(VERSION 3.8)
project(cansiPonto2d)

set(CMAKE_C_STANDARD 99)
SET(CMAKE_VERBOSE_MAKEFILE ON)
SET(CMAKE_C_FLAGS "-Wall -Werror")

file(GLOB SOURCE_FILES "*.c")
file(GLOB HEADER_FILES "*.h")

include_directories(inc)

# your app
add_executable(cansiPonto2d ${SOURCE_FILES} ${HEADER_FILES})