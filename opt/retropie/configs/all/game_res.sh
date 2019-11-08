vcgencmd hdmi_timings 1920 1 50 224 303 224 1 10 3 24 0 0 0 60.000000 0 39103020.000000 1
tvservice -e  "DMT 87" > /dev/null
sleep 0.3
fbset -depth 8 && fbset -depth 24
sleep 0.3
