#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
OCTO_DIR=$HOME_DIR/OctoPrint
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USER_PI="sudo -u pi"

#AVRDUDE
SERIAL_PATH="/dev/ttyACM0"
flash_arduino () {
    avrdude -p m2560 -c wiring -P $SERIAL_PATH -b 115200 -F -v -U flash:w:$1 -D
}

kill_octoprint () {
    service octoprint stop
}
#-------------------------------Kivy Update Screen-----------------------------------

kivy_run () {
    $USER_PI $HOME_DIR/$VENV/bin/python $1
}

#------------------------------ Main Update----------------------------------
kill_octoprint

kivy_run $THIS_DIR/Kivy_Popup_Updater/main.py & 
#do the update
flash_arduino $THIS_DIR/Marlin.ino.hex


#exit
exit 0