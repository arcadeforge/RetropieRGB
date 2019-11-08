#!/usr/bin/env bash
#title           :	runcommand-onstart.sh
#description     :	This script perform the following
#					Determines if the game being run is a console or an arcade/fba
#					For arcades, it will programatically determine the resolution based on resolution.ini file
#					For consoles, hdmi_timings can be set based on emulator or system
#					Dynamically creates the game_name.zip.cfg file and sets the custom_viewport_height
#					Dynamically add these parameters (video_allow_rotate = "true" and video_rotation = 1) for vertical games
#					vertical.txt contains all the mame 0.184 vertical games
#					Ability to set custom_viewport_width for arcades/fba
#author          :  Jochen Zurborg
#date            :	2019-11-19
#version         :	0.1
#notes           :	For advance users only and would need to be tweaked 
#					to cater to your needs and preference
#					resolution.ini (0.184) file needed http://www.progettosnaps.net/renameset/
#===============================================================================================================

log=/home/pi/log.txt

. /home/pi/rgb_config.sh

# get the system name
system=$1

# get the emulator name
emul=$2
emul_lr=${emul:0:2}

# get the full path filename of the ROM
rom_fp=$3
rom_bn=$3

# Game or Rom name
rom_bn="${rom_bn%.*}"
rom_bn="${rom_bn##*/}"

path=/opt/retropie/configs/all

function prep_res ()
{
    mme4crt $1 $2 $3 $mme4crt_shift 1 0 >> $log
    dir=$(pwd)
    cp $dir/game_res.sh $path
    cp $dir/retroarch_game.cfg $path
    chmod +x $path/game_res.sh
    cp $path/retroarch_game.cfg "$rom_fp"".cfg" 

}

# Determine if arcade or fba then determine resolution, set hdmi_timings else goto console section
if [[ "$system" == "arcade" ]] || [[ "$system" == "fba" ]] || [[ "$system" == "mame-libretro" ]] ; then
    echo "rom $rom_bn" >> $log
    
	# get resolution of rom
	rom_resolution=$(grep "$rom_bn;" $path/arcade_res_table.txt | cut -d";" -f3) 
	rom_resolution_width=$(echo $rom_resolution | cut -f1 -d"x")
	rom_resolution_height=$(echo $rom_resolution | cut -f2 -d"x" | cut -f1 -d"@")
	rom_resolution_freq=$(echo $rom_resolution | cut -f2 -d"x" | cut -f2 -d"@")
	
	echo $rom_resolution >> $log
	
	# Set rom_resolution_height for 480p and 448p roms
	if [ $rom_resolution_height == "480" ]; then
		rom_resolution_height="240"
	elif [ $rom_resolution_height == "448" ]; then
		rom_resolution_height="224"		
	fi


	# Create rom_name.cfg
	if ! [ -f "$rom_fp"".cfg" ]; then 
		touch "$rom_fp"".cfg" 
	fi

    prep_res $rom_resolution_width $rom_resolution_height $rom_resolution_freq


	# determine if vertical  
	if grep -w -q "$rom_bn" /opt/retropie/configs/all/vertical.txt ; then 
		# Add vertical parameters (video_allow_rotate = "true")
		if ! grep -q "video_allow_rotate" "$rom_fp"".cfg"; then
			echo -e "video_allow_rotate = \"true\"" >> "$rom_fp"".cfg" 2>&1
		fi
		# Add vertical parameters (video_rotation = 1)
		if ! grep -q "video_rotation" "$rom_fp"".cfg"; then
			echo -e "video_rotation = \"1\"" >> "$rom_fp"".cfg" 2>&1
		fi
	fi

# hier besser eine Standard super res.
else
    prep_res 320 224 60

fi

$path/game_res.sh
