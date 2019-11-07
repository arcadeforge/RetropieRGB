grep es_rotate /boot/config.txt > /home/pi/config.sh
chmod +x /home/pi/config.sh

num=$(more /home/pi/config.sh | wc -l)

if [ $num -eq 0 ] ; then
	echo "es_rotate=0" > /home/pi/config.sh
	echo "es_rotate=0" > /boot/config.txt
fi

. /home/pi/config.sh

emulationstation --screenrotate $es_rotate
