#! /bin/bash
# UbuntuClassImageUpdate-Chrome.sh
# Chrome is well, Chrome...  
echo "----------------------------------------------------"
echo "installing Chrome"
echo "----------------------------------------------------"
echo " "
echo "sudo wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
sudo wget -O google-chrome-stable_current_amd64.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo "sudo apt install ./google-chrome-stable_current_amd64.deb -y"
sudo apt install ./google-chrome-stable_current_amd64.deb -y
echo "cat /etc/apt/sources.list.d/google-chrome.list"
cat /etc/apt/sources.list.d/google-chrome.list
echo " "
echo "----------------------------------------------------"
echo "Done Installing Chrome"
echo "----------------------------------------------------"
