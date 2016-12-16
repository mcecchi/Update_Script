#!/bin/bash

# sed -i '7s%.*%\turl = https://github.com/Robo3D/OctoPrint.git%' /home/pi/OctoPrint/.git/config

# cd /home/pi/OctoPrint/
# git pull


# #store that the update has occured
echo ${0##*/} >> /home/pi/.updates.txt
echo "Update Complete!"
exit 0