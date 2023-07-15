#!/bin/sh

# Utility function for colors
# 
# BLACK=`tput setaf 0`
# RED=`tput setaf 1`
# GREEN=`tput setaf 2`
# YELLOW=`tput setaf 3`
# BLUE=`tput setaf 4`
# MAGENTA=`tput setaf 5`
# CYAN=`tput setaf 6`
# WHITE=`tput setaf 7`

# BOLD=`tput bold`
# RESET=`tput sgr0`

cecho() {
  local code=`tput sgr0`
  case "$1" in
    black  | bk) color=`tput setaf 0`;;
    red    |  r) color=`tput setaf 1`;;
    green  |  g) color=`tput setaf 2`;;
    yellow |  y) color=`tput setaf 3`;;
    blue   |  b) color=`tput setaf 4`;;
    purple |  p) color=`tput setaf 5`;;
    cyan   |  c) color=`tput setaf 6`;;
    gray   | gr) color=`tput setaf 7`;;
    *) local text="$1"
  esac
  [ -z "$text" ] && local text="${color}$2${code}"
  echo "$text"
}
