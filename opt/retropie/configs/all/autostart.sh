#!/bin/bash

# script for preparing RetroPieRGB config script



rgb_config=/home/pi/rgb_config.sh
rgb_default_config=/home/pi/rgb_default_config.sh
config=/boot/config.txt
log=/home/pi/log.txt

rm $log > /dev/null
# read config.txt and put all config parameters for RetroPieRGB Parameters to 
# rgb_config


function pikeyd165_start ()
{
    sudo chmod a+rwx /dev/uinput
    pikeyd165_stop
    sudo -s pikeyd165 -smi -ndb -d &> /dev/null
}

function pikeyd165_stop ()
{
 
    sudo chmod a+rwx /dev/uinput

    sudo -s  pikeyd165 -k &> /dev/null
    #killall pikeyd165
}



function get_params()
{

    while IFS== read -r param default_value; do

	    result=$(grep $param $config)

	    if [ -z "$result" ] ; then
		    echo "$param=$default_value" | sudo tee -a $config
        else
            # var exists in config.txt
            echo "variable in config.txt exists" >> $log
            echo "sync calue in rgb_config" >> $log

            echo $result >> $log
            value=$(echo $result|cut -d"=" -f2)
            echo $value >> $log
            sed -i "s/^$param.*/$param=$value/" $rgb_config

	    fi

    done < $rgb_default_config
}



rm $rgb_config
cp $rgb_default_config $rgb_config

get_params

chmod +x $rgb_config
. $rgb_config


if [ "$pi2jamma" == "1" ]; then
    echo "pi2jamma activated" >> $log
    pikeyd165_start
else
    echo "pi2jamma deactivated" >> $log
    pikeyd165_stop
fi    


emulationstation --screenrotate $es_rotate
