#!/bin/bash

start_time=$(date +%s.%N)

get_file_type() {
    local file="$1"
    if [[ -x "$file" ]]; then
        echo "exe"
    elif [[ "$file" == *.log ]]; then
        echo "log"
    elif [[ "$file" == *.conf ]]; then
        echo "conf"
    elif [[ -L "$file" ]]; then
        echo "link"
    elif [[ "$file" == *.txt || "$file" == *.md ]]; then
        echo "text"
    elif [[ "$file" == *.zip || "$file" == *.tar || "$file" == *.gz ]]; then
        echo "archive"
    elif [[ "$file" == *.sh ]]; then
        echo "sh"
    else
        echo "unknown"
    fi
}
