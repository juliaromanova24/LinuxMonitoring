#!/bin/bash

print_system_info () {
set_col1() {
    set_color $COLUMN1_BACKGROUND $COLUMN1_FONT_COLOR
}
set_col2() {
    set_color $COLUMN2_BACKGROUND $COLUMN2_FONT_COLOR
}
local HOSTNAME=$(hostname)
local TIMEZONE=$(timedatectl show --property=Timezone --value)
local USER=$(whoami)
local OS=$(lsb_release -d | awk -F'\t' '{print $2}')
local DATE=$(date +"%d %B %Y %H:%M:%S")
local UPTIME=$(uptime -p | sed 's/up //')
local UPTIME_SEC=$(cat /proc/uptime | awk '{print $1}' | cut -d. -f1)
local IP=$(hostname -I | awk '{print $1}')
local MASK=$(ifconfig | grep -m 1 'inet ' | awk '{print $4}')
local GATEWAY=$(ip route | grep default | awk '{print $3}')
local RAM_TOTAL=$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $2}')
local RAM_USED=$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $3}')
local RAM_FREE=$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $4}')
local SPACE_ROOT=$(df -m / | awk 'NR==2{printf "%.2f MB\n", $2}')
local SPACE_ROOT_USED=$(df -m / | awk 'NR==2{printf "%.2f MB\n", $3}')
local SPACE_ROOT_FREE=$(df -m / | awk 'NR==2{printf "%.2f MB\n", $4}')

echo $(set_col1) "HOSTNAME" $(reset) "=" $(set_col2) "$HOSTNAME" $(reset)
echo $(set_col1) "TIMEZONE" $(reset) "=" $(set_col2) "$TIMEZONE" $(reset)
echo $(set_col1) "USER" $(reset) "=" $(set_col2) "$USER" $(reset)
echo $(set_col1) "OS" $(reset) "=" $(set_col2) "$OS" $(reset)
echo $(set_col1) "DATE" $(reset) "=" $(set_col2) "$DATE" $(reset)
echo $(set_col1) "UPTIME" $(reset) "=" $(set_col2) "$UPTIME" $(reset)
echo $(set_col1) "UPTIME_SEC" $(reset) "=" $(set_col2) "$UPTIME_SEC" $(reset)
echo $(set_col1) "IP" $(reset) "=" $(set_col2) "$IP" $(reset)
echo $(set_col1) "MASK" $(reset) "=" $(set_col2) "$MASK" $(reset)
echo $(set_col1) "GATEWAY" $(reset) "=" $(set_col2) "$GATEWAY" $(reset)
echo $(set_col1) "RAM_TOTAL" $(reset) "=" $(set_col2) "$RAM_TOTAL" $(reset)
echo $(set_col1) "RAM_USED" $(reset) "=" $(set_col2) "$RAM_USED" $(reset)
echo $(set_col1) "RAM_FREE" $(reset) "=" $(set_col2) "$RAM_FREE" $(reset)
echo $(set_col1) "SPACE_ROOT" $(reset) "=" $(set_col2) "$SPACE_ROOT" $(reset)
echo $(set_col1) "SPACE_ROOT_USED" $(reset) "=" $(set_col2) "$SPACE_ROOT_USED" $(reset)
echo $(set_col1) "SPACE_ROOT_FREE" $(reset) "=" $(set_col2) "$SPACE_ROOT_FREE" $(reset)
}

