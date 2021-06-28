#! /bin/bash
# UbuntuClassImageUpdate-Arduino.sh
# Installing Arduino 64 bit Software...  
echo "----------------------------------------------------"
echo "installing Arduino 64 Bit IDE"
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
# check on the arduino site to find the latest version. 

echo "sudo wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.15-linux64.tar.xz"
sudo wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.15-linux64.tar.xz
echo "----------------------------------------------------"
echo "sudo tar xvf arduino-1.8.15-linux64.tar.xz -y"
sudo tar xvf arduino-1.8.15-linux64.tar.xz -y
echo "----------------------------------------------------"
echo "ls"
ls
echo " "
cd arduino-*
pwd
ls
#sudo ./install.sh
echo "----------------------------------------------------"
echo "Done Installing Arduino IDE"
echo "----------------------------------------------------"
