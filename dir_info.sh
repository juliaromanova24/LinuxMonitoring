#!/bin/bash


count_folders() {
    local dir="$1"
    find "$1" -type d | wc -l
}

get_top_folders() {
    local dir="$1"
    du -h --max-depth=2 "$1" 2>/dev/null | sort -hr | head -n6
}
print_directory_info() {
    local dir="$1"
    total_folders=$(count_folders "$1")
    echo "Total number of folders (including all nested ones) = $total_folders"
}
print_top_folders() {
    local dir="$1"
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    index=1
    get_top_folders "$dir" 2>/dev/null | tail -n +2 | while read -r line; do
        size=$(echo "$line" | awk '{print $1}')
        path=$(echo "$line" | awk '{print $2}')
        echo "$index - $path/, $size"
        ((index++))
    done
}
