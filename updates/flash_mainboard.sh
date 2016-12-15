#!/bin/bash
THIS_DIR=`dirname $0`


#AVRDUDE
SERIAL_PATH="/dev/ttyACM0"
flash_arduino () {
    avrdude -p m2560 -c wiring -P $SERIAL_PATH -b 115200 -F -v -U flash:w:$1 -D
}
#AVRDude
apt-get install -y avrdude
#flash the board
cd $THIS_DIR/../assets
flash_arduino $ASSETS_DIR/Marlin.ino.hex

#complete the update
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
