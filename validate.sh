#!/bin/bash

validate_parameters() {
    for param in "$@"; do
        if ! [[ $param =~ ^[1-6]$ ]]; then
            echo "Error:Enter a number from 1-6"
            return 1
        fi
    done

    return 0
}
