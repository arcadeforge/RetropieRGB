model=$(cat /proc/device-tree/model | cut -c1-14)
#echo $model

if [ ! "$model" == "Raspberry Pi 4" ]; then

  vcgencmd hdmi_timings 320 1 16 30 34 240 1 2 3 22 0 0 0 60 0 6400000 1  > /dev/null
  sleep 0.3
  tvservice -e "DMT 87" > /dev/null
  sleep 0.3
  fbset -depth 8 && fbset -depth 16 -xres 320 -yres 240 > /dev/null
fi
