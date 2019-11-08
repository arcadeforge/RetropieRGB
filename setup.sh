echo "installing files"

cp opt/retropie/configs/all/autostart.sh  /opt/retropie/configs/all/
cp home/pi/RetroPie/retropiemenu/rotate\ screen.sh  /home/pi/RetroPie/retropiemenu
cp home/pi/rgb_default_config.sh /home/pi/
sudo cp usr/local/bin/mme4crt /usr/local/bin/
cp opt/retropie/configs/all/vertical.txt /opt/retropie/configs/all/
cp opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/
cp /opt/retropie/configs/all/runcommand-onstart.sh /opt/retropie/configs/all/runcommand-onstart.sh_asche
cp opt/retropie/configs/all/arcade_res_table.txt /opt/retropie/configs/all/

more setup.sh
echo "done."
