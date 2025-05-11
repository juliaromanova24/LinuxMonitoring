#!/bin/bash

source ./get_name.sh
source ./save_info.sh

main() {
    local info=$(get_system_info) 
     
    get_system_info "$info"

    read -p "Do you want to save this information to a file? (Y/N):" save_choice

    if [[ "$save_choice" =~ ^[Yy]$ ]]; then
        save_info "$info"
        echo "Saved."
    elif [[ "$save_choice" =~ ^[Nn]$ ]]; then
        echo "File was not saved."
    else
        echo "Try again. (Enter Y or N)"
    fi
}
main
