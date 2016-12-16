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
install_plugin "https://github.com/Robo3D/octoprint-customControl/archive/master.zip"

#Marlin EEPROM Editor
install_plugin "https://github.com/Robo3D/OctoPrint-EEPROM-Marlin/archive/master.zip"

#Firmware Updater - Robo Controlled
install_plugin "https://github.com/Robo3D/OctoPrint-FirmwareUpdater/archive/master.zip"

#persistent Mainboard connection
install_plugin "https://github.com/Robo3D/OctoPrint-MainboardConnection/archive/master.zip"

#Netconnectd
install_plugin "https://github.com/Robo3D/OctoPrint-Netconnectd/archive/master.zip"

#Robotheme
install_plugin "https://github.com/Robo3D/OctoPrint-robotheme/archive/master.zip"

#Print History
install_plugin "https://github.com/Robo3D/OctoPrint-PrintHistory/archive/master.zip"

#Printer stats
install_plugin "https://github.com/Robo3D/OctoPrint-Stats/archive/master.zip"

#Request Spinner
install_plugin "https://github.com/Robo3D/OctoPrint-RequestSpinner/archive/master.zip"

#ScreenSquish
install_plugin "https://github.com/Robo3D/OctoPrint-ScreenSquish/archive/master.zip"

#kaa print event
install_plugin "https://github.com/Robo3D/Kaa_Printevent/archive/master.zip"

#lani
install_plugin "https://github.com/mikerybka/OctoPrint-Lani/archive/master.zip"

#Alexa
install_plugin "https://github.com/Robo3D/Octoprint_Alexa/archive/master.zip"

#RoboLCD
install_plugin "https://github.com/victorevector/RoboLCD/archive/master.zip"


#store that the update has occured
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0
