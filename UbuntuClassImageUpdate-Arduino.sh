#! /bin/bash
# UbuntuClassImageUpdate-Arduino.sh
# Installing Arduino 32 bit Software...  
echo "----------------------------------------------------"
echo "installing Chrome"
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
echo "sudo wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo "----------------------------------------------------"
echo "sudo apt install ./google-chrome-stable_current_amd64.deb -y"
sudo apt install ./google-chrome-stable_current_amd64.deb -y
echo "----------------------------------------------------"
echo "cat /etc/apt/sources.list.d/google-chrome.list"
cat /etc/apt/sources.list.d/google-chrome.list
echo " "
echo "----------------------------------------------------"
echo "Done Installing Chrome"
echo "----------------------------------------------------"
