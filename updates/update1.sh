#!/bin/bash

THIS_DIR=`dirname $0`
echo $THIS_DIR

cd $THIS_DIR/../assets
cat Marlin.ino.hex

echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"

exit 0
