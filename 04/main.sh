#!/bin/bash

source ./utils.sh
source ./system_info.sh

DEFAULT_COLUMN1_BACKGROUND=1
DEFAULT_COLUMN1_FONT_COLOR=2
DEFAULT_COLUMN2_BACKGROUND=3
DEFAULT_COLUMN2_FONT_COLOR=4

if [[ -f "conf.cfg" ]]; then
    source "conf.cfg"
else
    echo "Config file not found. Using default color scheme."
fi

check_parameters() {
    local background=$1
    local font_color=$2
    if [[ -n "$background" && ( "$background" -lt 1 || "$background" -gt 6) ]]; then
         echo "Error: Enter number from 1-6 for background color"
         exit 1
    fi
    if [[ -n "$font_color" && ( "$font_color" -lt 1 || "$font_color" -gt 6 ) ]]; then
         echo "Error: Enter number from 1-6 for font_color"
         exit 1
    fi
}

check_parameters "${column1_background:-}" "${column1_font_color:-}" 
check_parameters "${column2_background:-}" "${column2_font_color:-}"

COLUMN1_BACKGROUND=${column1_background:-$DEFAULT_COLUMN1_BACKGROUND}
COLUMN1_FONT_COLOR=${column1_font_color:-$DEFAULT_COLUMN1_FONT_COLOR}
COLUMN2_BACKGROUND=${column2_background:-$DEFAULT_COLUMN2_BACKGROUND}
COLUMN2_FONT_COLOR=${column2_font_color:-$DEFAULT_COLUMN2_FONT_COLOR}

if [[ $COLUMN1_BACKGROUND == $COLUMN1_FONT_COLOR || $COLUMN2_BACKGROUND == $COLUMN2_FONT_COLOR ]]; then
    echo "Error:The colours should not match. Try again"
    exit 1
fi 

print_system_info
echo 
print_color_scheme
