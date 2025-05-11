#!/bin/bash
get_system_info () {
echo "HOSTNAME" "$(hostname)"
echo "TIMEZONE" "$(timedatectl show --property=Timezone --value)"
echo "USER" "$(whoami)"
echo "OS" "$(lsb_release -d | awk -F'\t' '{print $2}')"
echo "DATE" "$(date +"%d %B %Y %H:%M:%S")"
echo "UPTIME" "$(uptime -p | sed 's/up //')"
echo "UPTIME_SEC" "$(cat /proc/uptime | awk '{print $1}' | cut -d. -f1)"
echo "IP" "$(hostname -I | awk '{print $1}')"
echo "MASK" "$(ifconfig | grep -m 1 'inet ' | awk '{print $4}')"
echo "GATEWAY" "$(ip route | grep default | awk '{print $3}')"
echo "RAM_TOTAL" "$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $2}')"
echo "RAM_USED" "$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $3}')"
echo "RAM_FREE" "$(free -g | awk '/^Mem:/{printf "%.3f GB\n", $4}')"
echo "SPACE_ROOT" "$(df -m / | awk 'NR==2{printf "%.2f MB\n", $2}')"
echo "SPACE_ROOT_USED" "$(df -m / | awk 'NR==2{printf "%.2f MB\n", $3}')"
echo "SPACE_ROOT_FREE" "$(df -m / | awk 'NR==2{printf "%.2f MB\n", $4}')"

}
