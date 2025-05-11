#!/bin/bash

set_color() {
    local background=$1
    local font_color=$2
    echo -e "\e[4${background};3${font_color}m"
}
reset() {
    echo -e "\e[0m"
}
print_color_scheme() {
    local col1_bg_text="default"
    local col1_fc_text="default"
    local col2_bg_text="default"
    local col2_fc_text="default"
    if [[ -f "conf.cfg" ]]; then
         col1_bg_text=$COLUMN1_BACKGROUND
         col1_fc_text=$COLUMN1_FONT_COLOR
         col2_bg_text=$COLUMN2_BACKGROUND
         col2_fc_text=$COLUMN2_FONT_COLOR
    fi

    echo "Column 1 background = ${col1_bg_text} ($(get_color_name $COLUMN1_BACKGROUND))"
    echo "Column 1 font color = ${col1_fc_text} ($(get_color_name $COLUMN1_FONT_COLOR))"
    echo "Column 2 background = ${col2_bg_text} ($(get_color_name $COLUMN2_BACKGROUND))"
    echo "Column 2 font color = ${col2_fc_text} ($(get_color_name $COLUMN2_FONT_COLOR))"
}
get_color_name() {
    case $1 in 
        1) echo "white";;
        2) echo "red";;
        3) echo "green";;
        4) echo "blue";;
        5) echo "purple";;
        6) echo "black";;
        *) echo "unknown";;
    esac
}
#set_color_scheme() {
#    COLUMN1_BACKGROUND=$1
#    COLUMN1_FONT_COLOR=$2
#    COLUMN2_BACKGROUND=$3
#    COLUMN2_FONT_COLOR=$4

#    if [[ $COLUMN1_BACKGROUND == $COLUMN1_FONT_COLOR || $COLUMN2_BACKGROUND == $COLUMN2_FONT_COLOR ]]; then
#        echo "Error: The colors should not match. Try again"
#        exit 1
#    fi
#}

