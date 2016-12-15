#!/bin/bash

THIS_DIR=`dirname $0`
echo $THIS_DIR

echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"

exit 0
