#!/bin/bash

save_info () {
    local system_info="$1"
    local filename=$(date "+%d_%m_%y_%H_%M_%S.status")
    
    echo "$system_info" > "$filename"
    echo "Information saved to $filename"
}
