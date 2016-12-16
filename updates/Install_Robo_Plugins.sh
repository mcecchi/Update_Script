#!/bin/bash
HOME_DIR="/home/pi"
VENV="oprint"
OCTO_DIR=$HOME_DIR/OctoPrint
USER_PI="sudo -u pi"

######octoprint plugins #######
install_plugin () {
    $USER_PI $HOME_DIR/$VENV/bin/pip install $1
}

#Custom Controls Plugin
$USER_PI $HOME_DIR/$VENV/bin/pip install "https://github.com/Robo3D/octoprint-customControl/archive/master.zip" "https://github.com/Robo3D/OctoPrint-EEPROM-Marlin/archive/master.zip" "https://github.com/Robo3D/OctoPrint-FirmwareUpdater/archive/master.zip" "https://github.com/Robo3D/OctoPrint-MainboardConnection/archive/master.zip" "https://github.com/Robo3D/OctoPrint-Netconnectd/archive/master.zip" "https://github.com/Robo3D/OctoPrint-robotheme/archive/master.zip" "https://github.com/Robo3D/OctoPrint-PrintHistory/archive/master.zip" "https://github.com/Robo3D/OctoPrint-Stats/archive/master.zip" "https://github.com/Robo3D/OctoPrint-RequestSpinner/archive/master.zip" "https://github.com/Robo3D/OctoPrint-ScreenSquish/archive/master.zip" "https://github.com/Robo3D/Kaa_Printevent/archive/master.zip" "https://github.com/mikerybka/OctoPrint-Lani/archive/master.zip" "https://github.com/Robo3D/Octoprint_Alexa/archive/master.zip" "https://github.com/victorevector/RoboLCD/archive/master.zip"


#store that the update has occured
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0
