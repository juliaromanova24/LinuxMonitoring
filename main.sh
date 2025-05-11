#!/bin/bash

source ./utils.sh
source ./dir_info.sh
source ./file_info.sh


    if [[ $# -ne 1 ]]; then
        echo "Error: Not enough parameters. Try again"
        exit 1
    elif [[ ! -d "${1%/}" ]]; then
        echo "Error: '$1' is not valid directory"
        exit 1
    fi
DIR_PATH="${1%/}"

print_directory_info "$DIR_PATH"
print_top_folders "$DIR_PATH"
print_file_statistics "$DIR_PATH"
print_top_files "$DIR_PATH"
#print_top_executables "$DIR_PATH"

end_time=$(date +%s.%N)
execution_time=$(echo "$end_time -$start_time" | bc)
echo "Script execution time (in seconds) = $execution_time"
