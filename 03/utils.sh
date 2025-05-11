#!/bin/bash

set_color() {
    local background=$1
    local font_color=$2
    echo -e "\e[4${background};3${font_color}m"
}
reset_color() {
    echo -e "\e[0m"
}
set_color_scheme() {
    COLUMN1_BACKGROUND=$1
    COLUMN1_FONT_COLOR=$2
    COLUMN2_BACKGROUND=$3
    COLUMN2_FONT_COLOR=$4

    if [[ $COLUMN1_BACKGROUND == $COLUMN1_FONT_COLOR || $COLUMN2_BACKGROUND == $COLUMN2_FONT_COLOR ]]; then
        echo "Error: The colors should not match. Try again"
        exit 1
    fi
}

