#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
USER_PI="sudo -u pi"
THIS_DIR=`dirname $0`

# Detect filament installation status
$HOME_DIR/$VENV/bin/python $THIS_DIR/../assets/upgrade_pkg.py "https://github.com/Robo3D/Octoprint-Filament/archive/2.3.zip"


#complete the update
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0
