#!/bin/bash

check_parameters() {
    if [ "$#" -ne 4 ]; then
       echo "n/a" 
       exit 1
    fi

    for param in "$@"; do
        if ! [[ "$param" =~ ^[1-6]$ ]]; then
             echo "n/a"
             exit 1
        fi
    done
    if [[ "$1" == "$3" ]] || [[ "$2" == "$4" ]]; then
        echo "n/a"
        exit 1
    fi
}
