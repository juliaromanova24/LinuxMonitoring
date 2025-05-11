#!/bin/bash
get_system_info () {
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

echo "HOSTNAME = $HOSTNAME
TIMEZONE = $TIMEZONE
USER = $USER
OS = $OS
DATE = $DATE
UPTIME = $UPTIME
UPTIME_SEC = $UPTIME_SEC
IP = $IP
MASK = $MASK
GATEWAY = $GATEWAY
RAM_TOTAL = $RAM_TOTAL
RAM_USED = $RAM_USED
RAM_FREE = $RAM_FREE
SPACE_ROOT = $SPACE_ROOT
SPACE_ROOT_USED = $SPACE_ROOT_USED
SPACE_ROOT_FREE = $SPACE_ROOT_FREE"
}
