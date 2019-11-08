#####
# this scripts rotates screen for emulationstation 
# Author Jochen Zurborg
# Date : 06.11.2019
#
# This script is made for hardware pi2scart and pi2jamma from www.arcadeforge.de

setterm -foreground black -store

killall emulationstation > /dev/null 2>&1
clear

sleep 1

# params was already fetched
. /home/pi/rgb_config.sh


new_rotate=$(( $es_rotate + 1 ))
if [ $new_rotate -eq 4 ] ; then
    new_rotate=0
fi

#echo "starting emulationstation with rotate $new_rotate"
#sleep 1
sudo sed -i "s/^es_rotate.*/es_rotate=$new_rotate/" /boot/config.txt

sed -i "s/^es_rotate.*/es_rotate=$new_rotate/" /home/pi/rgb_config.sh

setterm -foreground white -store

emulationstation --screenrotate $new_rotate

