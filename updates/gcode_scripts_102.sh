#!/bin/bash

THIS_DIR=`dirname $0`
USER_PI="sudo -u pi"

#remove script files
echo "removing old script files"

rm /home/pi/.octoprint/scripts/gcode/afterPrintCancelled
rm /home/pi/.octoprint/scripts/gcode/afterPrintDone
rm /home/pi/.octoprint/scripts/gcode/afterPrintPaused
rm /home/pi/.octoprint/scripts/gcode/beforePrintResumed
rm /home/pi/.octoprint/scripts/gcode/beforePrintStarted

echo "Installing gcode_cmds"

#$USER_PI cp -a $THIS_DIR/../assets/gcode_scripts/. /home/pi/.octoprint/scripts/gcode/

#store that the update has occured
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0
