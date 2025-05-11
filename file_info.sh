#!/bin/bash

count_files() {
    local dir="$1"
    find "$dir" -type f | wc -l
}
count_file_types() {
    local dir="$1"
    conf_files=$(find "$dir" -type f -name "*.conf" | wc -l)
    text_files=$(find "$dir" -type f \( -name "*.txt" -o -name "*.md" \) | wc -l)
    exe_files=$(find "$dir" -type f -executable | wc -l)
    log_files=$(find "$dir" -type f -name "*.log" | wc -l)
    archive_files=$(find "$dir" -type f \( -name "*.zip" -o -name "*.tar" -o -name "*.gz" \) | wc -l)
    link_files=$(find "$dir" -type l | wc -l)
    echo "Configuration files (with the .conf extension) = $conf_files"
    echo "Text_files = $text_files"
    echo "Executable files = $exe_files"
    echo "Log files (with the extension .log) = $log_files"
    echo "Archive files = $archive_files"
    echo "Symbolic links = $link_files"
}
get_top_files() {
    local dir="$1"
    find "$dir" -type f -exec ls -lh {} + 2>/dev/null | sort -hrk 5 | head -n 10
}
get_top_executables() {
   local dir="$1"
    find "$dir" -type f -executable -exec ls -lh {} + 2>/dev/null | sort -hrk 5 | head -n 10
}
print_file_statistics() {
    local dir="$1"
    total_files=$(count_files "$dir")
    echo "Total number of files = $total_files"
    echo "Number of:"
    count_file_types "$dir"
}
print_top_files() {
    local dir="$1"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    index=1
    get_top_files "$dir" | while read -r line; do
        size=$(echo "$line" | awk '{print $5}')
        path=$(echo "$line" | awk '{print $9}')
        type=$(get_file_type "$path")
        echo "$index - $path, $size, $type"
        ((index++))
    done
}
print_top_executables() {
    local dir="$1"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5):"
    index=1
    get_top_executables "$dir" | while read -r line; do
        size=$(echo "$line" | awk '{print $5}')
        path=$(echo "$line" | awk '{print $9}')
        hash=$(md5sum "$path" | awk '{print $1}')
        echo "$index - $path, $size, $hash"
        ((index++))
    done
}
