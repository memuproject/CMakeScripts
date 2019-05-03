# Colon column for option messages
if (NOT DEFINED MESSAGE_OPTION_VALUE_START)
    set(MESSAGE_OPTION_VALUE_START 32)
endif ()

# Print a tabbed key-value
function(message_option mode key value)
    string(LENGTH ${key} KEY_LEN)

    while (${KEY_LEN} LESS ${MESSAGE_OPTION_VALUE_START})
        set(key "${key} ")
        math(EXPR KEY_LEN "${KEY_LEN}+1")
    endwhile ()

    message(${mode} "${key} : ${value}")
endfunction()

# Check if option is set, add definitions if required and print value using option_message
function(message_check_option option name default definition)
    if (${option})
        if (${default})
            message_option(STATUS "    ${name}" "ON  (Default)")
        else ()
            message_option(STATUS "    ${name}" "ON")
        endif ()

        add_definitions(-D${definition})
    else ()
        if (NOT ${default})
            message_option(STATUS "    ${name}" "OFF (Default)")
        else ()
            message_option(STATUS "    ${name}" "OFF")
        endif ()
    endif ()
endfunction()
