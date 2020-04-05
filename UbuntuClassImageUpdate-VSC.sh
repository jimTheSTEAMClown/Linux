#! /bin/bash
# UbuntuClassImageUpdate-VSC.sh
# Visual Studion Code is a Coding IDE  
# https://code.visualstudio.com/download
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
echo "----------------------------------------------------"
echo "Installing Visual Studion Code, which is a Coding IDE"
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
echo "sudo apt update"
sudo apt update
echo "----------------------------------------------------"
echo "sudo apt install software-properties-common apt-transport-https wget -y"
sudo apt install software-properties-common apt-transport-https wget -y
echo "----------------------------------------------------"
echo "sudo wget -O -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -"
sudo wget -O -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
echo "----------------------------------------------------"
echo sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y"
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" -y
echo "----------------------------------------------------"
echo "sudo apt update"
sudo apt update
echo "----------------------------------------------------"
echo "sudo apt install code -y"
sudo apt install code -y
echo "----------------------------------------------------"
echo "code -v"
code -v
echo " "
echo "----------------------------------------------------"
echo "Done Installing Visual Studion Code"
echo "----------------------------------------------------"
