dir=$(pwd)
cd /home/pi/RetroPieRGB
git pull origin master
chmod +x patch.sh
./patch.sh
cd $dir
