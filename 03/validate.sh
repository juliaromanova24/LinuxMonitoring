#!/bin/bash

validate_parameters() {
    if [[ $# -ne 4 ]]; then
        echo "Error:Not enough parameters"
        return 1
    fi

    for param in "$@"; do
        if ! [[ $param =~ ^[1-6]$ ]]; then
            echo "Error:Enter a number from 1-6"
            return 1
        fi
    done

    return 0
}
