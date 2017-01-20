#!/bin/bash

sed -i '58s/.*/dtoverlay=ads7846,penirq=17,penirq_pull=2,xohms=60,pmax=255,xmin=300,xmax=3932,ymin=294,ymax=3801/' /boot/config.txt


#store that the update has occured
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0
