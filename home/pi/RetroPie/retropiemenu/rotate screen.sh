#####
# this scripts rotates screen for emulationstation 
# Author Jochen Zurborg
# Date : 06.11.2019
#
# This script is made for hardware pi2scart and pi2jamma from www.arcadeforge.de


killall emulationstation 2> /dev/null

grep es_rotate /boot/config.txt >> /home/pi/config.sh
chmod +x /home/pi/config.sh
. /home/pi/config.sh
#rm  /home/pi/config.sh
echo $es_rotate

new_rotate=$($es_rotate + 1)
if [ $es_rotate -eq 4 ] ; then
	new_rotate=0
fi

echo "starting emulationstation with rotate $es_rotate"
sleep 2
emulationstation --screenrotate $es_rotate
