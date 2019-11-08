#!/bin/bash

# script for preparing RetroPieRGB config script

rgb_config=/home/pi/rgb_config.sh
rgb_default_config=/home/pi/rgb_default_config.sh
config=/boot/config.txt
log=/home/pi/log.txt

rm $log > /dev/null
# read config.txt and put all config parameters for RetroPieRGB Parameters to 
# rgb_config

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



emulationstation --screenrotate $es_rotate
