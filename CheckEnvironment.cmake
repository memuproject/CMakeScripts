# Helpers
include(Message)

function(set_and_define variable)
    set(${variable} TRUE CACHE INTERNAL "")
    add_definitions(-D${variable})
endfunction()

# Start
message(STATUS "Environment: ")

# Check platform
if (WIN32)
    message_option(STATUS "    Platform" "Windows")
    set_and_define(ENV_WINDOWS)

    if (MINGW)
        message_option(STATUS "    Windows toolset" "MinGW")
        set_and_define(ENV_MINGW)
    else ()
        message_option(STATUS "    Windows toolset" "UNKNOWN")
    endif ()
elseif (UNIX)
    message_option(STATUS "    Platform" "Linux")
    set_and_define(ENV_LINUX)
else ()
    message(FATAL_ERROR "Unsupported Platform")
endif ()

# Check compiler
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    message_option(STATUS "    Compiler" "GCC")
    set_and_define(ENV_GCC)
else ()
    message_option(STATUS "    Compiler" "UNKNOWN")
endif ()
