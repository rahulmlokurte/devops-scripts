#!/usr/bin/env sh
#This is used to colorize the messages in the terminal

echo "Executing: ${BASH_SOURCE[0]}"
function simple_echo() {
    echo >&2 "$*"
}

# function for outputting a Warning message in yellow
function warning_echo() {
    echo >&2 -e "\033[33m *******************WARNING:- $* ******************* \033[0m"
}

#function for outputting an Info message in green
function info_echo() {
    echo >&2 -e "\033[32m *******************INFO:- $* ******************* \033[0m"
}

# function for outputting a Success message in green
function success_echo() {
    echo >&2 -e "\033[32m *******************SUCCESS:- $* ******************* \033[0m"
}

# function for outputting a Failure message in red
function failure_echo() {
    echo >&2 -e "\033[31m *******************FAILURE:- $* ******************* \033[0m"
}

# function for outputting a Debug message in blue
function debug_echo() {
    echo >&2 -e "\033[34m *******************DEBUG:- $* ******************* \033[0m"
}

# function to run a command and error out if it fails
function run_command() {
    cmd="$@"

     # Run the command, check the return code, and error out if it failed.
    info_echo "Running command: $cmd"
    eval "$cmd"
    result=$?
    if [ $result -ne 0 ]; then
        failure_echo "Command failed with exit code $result: $cmd"
        exit $result
    fi
}


