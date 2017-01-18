#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
OCTO_DIR=$HOME_DIR/OctoPrint
USER_PI="sudo -u pi"

######octoprint plugins #######
install_plugin () {
    $USER_PI $HOME_DIR/$VENV/bin/pip install $1
}

#Install Meta Reader
install_plugin "https://github.com/Robo3D/Meta-Reader/archive/master.zip"

#Install the new Firmware Updater
install_plugin "https://github.com/Robo3D/OctoPrint-FirmwareUpdater/archive/master.zip"

#Install the new RoboLCD Version


#complete the update
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0

