#! /bin/bash
# UbuntuClassImageUpdate-Arduino.sh
# Installing Arduino 32 bit Software...  
echo "----------------------------------------------------"
echo "installing Arduino 32 BitIDE"
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
echo "sudo wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.13-linux32.tar.xz"
sudo wget https://www.arduino.cc/download_handler.php?f=/arduino-1.8.13-linux32.tar.xz
echo "----------------------------------------------------"
echo "sudo tar xvf arduino-1.8.13-linux32.tar.xz -y"
sudo tar xvf arduino-1.8.13-linux32.tar.xz -y
echo "----------------------------------------------------"
echo "ls"
ls
echo " "
cd Arduino-*
pwd
ls
#sudo ./install.sh
echo "----------------------------------------------------"
echo "Done Installing Arduino IDE"
echo "----------------------------------------------------"
