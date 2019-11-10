dir=$(pwd)
cd /home/pi/RetroPieRGB
sudo -s git pull origin master
chmod +x patch.sh
./patch.sh
cd $dir
