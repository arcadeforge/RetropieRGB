vcgencmd hdmi_timings 450 1 50 30 90 270 1 1 1 30 0 0 0 50 0 9600000 1 > /dev/null 
#vcgencmd hdmi_timings 320 1 2 26 43 240 1 3 7 12 0 0 0 60 0 6400000 1


tvservice -e "DMT 87"
#fbset -g 320 230 320 230 32 > /dev/null
sleep 0.3

#fbset -depth 8 && fbset -depth 16
#sleep 0.3
fbset -g 450 270 450 270 32 > /dev/null
# fb not put to screen
echo "res executed"
#sleep 0.3

#stty rows 44
