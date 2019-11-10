vcgencmd hdmi_timings 450 1 50 33 90 270 1 1 1 30 0 0 0 60 0 9600000 1 > /dev/null 


tvservice -e "DMT 87" > /dev/null
sleep 0.3

fbset -depth 8 && fbset -depth 16
sleep 0.3
fbset -g 450 270 450 270 32 > /dev/null

#sleep 0.3

#stty rows 44
