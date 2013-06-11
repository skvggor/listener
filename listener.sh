#!/bin/bash

# listener.sh
#
# AUTHOR
# ======
#   Marcker
#     - website: http://marcker.net
#     - e-mail: marckfree@gmail.com
#     - twitter: @marcker
#
# SINOPSIS
# ========
#  Listener is a script that serves to monitor file and apply 
#  commands at runtime.
#
# USE
# ===
#   ./listener.sh inputfile "commmands"
# 
#   Basic example:
#
#   * Terminal 1:
#       coffee -bcw scripts.coffee scripts.js
#
#     INPUT                           OUTPUT
#   scripts.coffe | CoffeScript    | scripts.js |
#                 | compiles to JS |
#
#   * Terminal 2:
#       ./listener.sh scripts.js "yuicompressor scripts.js -o scripts.min.js"
#
#     INPUT                          OUTPUT
#   scripts.js | listener.sh     | scripts.min.js
#              | + yuicompressor |
# 
#   Then when saving the scripts.coffe, scripts.min.js is updated.
# 

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