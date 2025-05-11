#!/bin/bash

validate_input() {
    local input="$1"
    [[ $# -ne 1 ]] && { echo "n/a"; return 1; }

    [[ "$input" =~ [0-9] ]] && { echo "n/a"; return 1; }

    [[ "$input" =~ [./,+-/%/^] ]] && { echo "n/a"; return 1; }

    echo "$input"
    return 0
} 
