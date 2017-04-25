#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
OCTO_DIR=$HOME_DIR/OctoPrint
USER_PI="sudo -u pi"
THIS_DIR=`dirname $0`


######octoprint plugins #######
install_plugin () {
    $USER_PI $HOME_DIR/$VENV/bin/pip install $1
}

#Install the new RoboLCD Version
install_plugin "https://github.com/victorevector/RoboLCD/archive/1.6.1.zip"
install_plugin "https://github.com/Robo3D/OctoPrint-FirmwareUpdater/archive/0.2.1.zip"
install_plugin "https://github.com/Robo3D/roboOctoprint/archive/1.3.2.zip"

#complete the update
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0