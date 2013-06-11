#!/bin/bash

filename=$1;commands=$2
listener_files () {
  RED="\033[01;31m";WHITE="\033[00;00m";GREEN="\033[00;92m"
  while
    echo -e "\n"
    echo -e "Listening file ${GREEN}$filename${WHITE}..................................."
    inotifywait -qqe close_write $filename
  do
    echo -e "Changing file ${RED}$filename${WHITE}...................................."
    $commands
  done
  return 0
}

listener_files