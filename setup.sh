echo "installing files"


cp opt/retropie/configs/all/autostart.sh  /opt/retropie/configs/all/
cp home/pi/RetroPie/retropiemenu/rotate\ screen.sh  /home/pi/RetroPie/retropiemenu
cp home/pi/rgb_default_config.sh /home/pi/
sudo cp usr/local/bin/mme4crt /usr/local/bin/
sudo rm /usr/local/bin/pikeyd165 > /dev/null
sudo cp usr/local/bin/pikeyd165 /usr/local/bin/
sudo cp etc/pikeyd165.conf /etc/
cp opt/retropie/configs/all/vertical.txt /opt/retropie/configs/all/
cp opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/
cp /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh_asche
cp opt/retropie/configs/all/arcade_res_table.txt /opt/retropie/configs/all/
cp opt/retropie/configs/all/runcommand-onend.sh /opt/retropie/configs/all/
sudo cp etc/emulationstation/themes.sh /etc/emulationstation/
cp home/pi/RetroPie-Setup/scriptmodules/supplementary/esthemes.sh /home/pi/RetroPie-Setup/scriptmodules/supplementary/
cp home/pi/RetroPie/retropiemenu/Update\ RetroPieRGB.sh /home/pi/RetroPie/retropiemenu/
sudo cp boot/config_lowres.txt /boot/config.txt
sudo chmod a+w /boot/config.txt

echo "done."
