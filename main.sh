#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
OCTO_DIR=$HOME_DIR/OctoPrint
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USER_PI="sudo -u pi"





#-------------------------------main updater-----------------------------------

kivy_run () {
    $USER_PI $HOME_DIR/$VENV/bin/python $1
}

kivy_run $THIS_DIR/Kivy_Popup_Updater/main.py & 
#do the update
sleep 5 


#exit
exit 0