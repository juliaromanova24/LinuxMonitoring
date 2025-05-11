#!/bin/bash

source ./utils.sh
source ./system_info.sh
source ./validate.sh
if ! validate_parameters "$@"; then
    exit 1
fi

COLUMN1_BACKGROUND=$1
COLUMN1_FONT_COLOR=$2
COLUMN2_BACKGROUND=$3
COLUMN2_FONT_COLOR=$4

set_color_scheme "$COLUMN1_BACKGROUND" "$COLUMN1_FONT_COLOR" "$COLUMN2_BACKGROUND" "$COLUMN2_FONT_COLOR"
print_system_info
