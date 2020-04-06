#! /bin/bash
cd ~
echo " ----------------------------------------------------"
echo "Create classImageBuild Directory where all these build files go"
echo " ----------------------------------------------------"
sudo mkdir classImageBuild
echo " ----------------------------------------------------"
echo "Copy UbunutClassImageUpdate.sh file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate.sh
sudo cat ./classImageBuild/UbuntuClassImageUpdate.sh

echo " ----------------------------------------------------"
echo "VLC build file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate-VLC.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate-VLC.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate-VLC.sh

echo " ----------------------------------------------------"
echo "Tixati build file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate-Tixati.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate-Tixati.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate-Tixati.sh

echo " ----------------------------------------------------"
echo "Visual Studio Code build file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate-VSC.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate-VSC.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate-VSC.sh

echo " ----------------------------------------------------"
echo "Chrome build file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate-Chrome.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate-Chrome.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate-Chrome.sh

echo " ----------------------------------------------------"
echo "Apps build file"
echo " ----------------------------------------------------"
sudo wget -O ./classImageBuild/UbuntuClassImageUpdate-Apps.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/UbuntuClassImageUpdate-Apps.sh
sudo chmod 755 ./classImageBuild/UbuntuClassImageUpdate-Apps.sh
UbuntuClassImageUpdate-Apps.sh

echo " ----------------------------------------------------"
echo "Done copying all the classImageBuild files"
echo " ----------------------------------------------------"
echo "Now, cd into the classImageBuild Directory and run the following command"
echo "cd classImageBuild"
echo "sudo bash UbuntuClassImageUpdate.sh"
