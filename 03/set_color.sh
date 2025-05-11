#!/bin/bash

set_fg_color() {
    case $1 in
        1) echo "\e[37m" ;; 
        2) echo "\e[31m" ;;
        3) echo "\e[32m" ;;
        4) echo "\e[34m" ;;
        5) echo "\e[35m" ;;
        6) echo "\e[30m" ;;
        *) echo "\e[37m" ;;
    esac
}
set_bg_color() {
    case $1 in
        1) echo "\e[47m" ;;
        2) echo "\e[41m" ;;
        3) echo "\e[42m" ;;
        4) echo "\e[44m" ;;
        5) echo "\e[45m" ;;
        6) echo "\e[40m" ;;
        *) echo "\e[47m" ;;
    esac
}
