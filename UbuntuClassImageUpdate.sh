#! /bin/bash
# ============================================================================
# shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu install
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/Linux
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		UbuntuClassImageUpdate.sh
# Description:    shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu installl 
# Dependencies:   
# Revision: 
#  Revision 0.02 - Updated 04/04/2020 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 04/04/2020
# Additional Comments: 
# see https://www.answers.com/Q/How_do_you_make_a_yes_no_command_in_cmd to add more features
# ============================================================================
echo "----------------------------------------------------"
echo "Ubuntu Class Image Update Script" 
echo "----------------------------------------------------"
echo " "
pwd
# ls -l
ls
echo " "
echo "----------------------------------------------------"
echo "Do you wish run the Ubuntu Class Image Update?"
echo "----------------------------------------------------"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------"
            echo "Running Ubuntu Class Image Update" 
            echo "----------------------------------------------------"
            break;;
        No ) 
            echo "----------------------------------------------------"
            echo "Exiting Without Update" 
            echo "----------------------------------------------------"
            exit;;
    esac
done
# ============================================================================
# update the software install to update with main universe restricted multiverse
# echo "----------------------------------------------------"
# echo "listing which software repositories are used - main universe restricted multiverse"
# echo "----------------------------------------------------"
# sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
grep ^[^#] /etc/apt/sources.list
# sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
echo " "

echo "----------------------------------------------------"
echo "Ready... I'm going to run "
echo "  Going to run $ update with -y"
echo "  Going to run $ upgrade with -y" 
echo "----------------------------------------------------"
echo "Do you wish to run UPDATE and UPGRADE?  Enter y/Y or n/N or any Key?"
read -p "update and upgrade?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Running $ update with -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get update -y
echo " "
echo "----------------------------------------------------"
echo "Done running Update"
echo "----------------------------------------------------"
echo "----------------------------------------------------"
echo "Running $ upgrade with -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get upgrade -y
echo " "
echo "----------------------------------------------------"
echo "Done running Upgrade"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Do you wish to install VLC?  Enter y/Y or n/N or any Key?"
read -p "Install VLC?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing VLC"
echo "Running $ bash UbuntuClassImageUpdate-VLC.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-VLC.sh
echo " "
echo "----------------------------------------------------"
echo "Done running script"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Do you wish to install Visual Studion Code?  Enter y/Y or n/N or any Key?"
read -p "Install VSC?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing VSC"
echo "Running $ bash UbuntuClassImageUpdate-VSC.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-VSC.sh
echo " "
echo "----------------------------------------------------"
echo "Done running script"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Do you wish to install Tixati?  It is a torrent program.  Enter y/Y or n/N or any Key?"
read -p "Install Tixati?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing Tixati"
echo "Running $ bash UbuntuClassImageUpdate-Tixati.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-Tixati.sh
echo " "
echo "----------------------------------------------------"
echo "Done running script"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Do you wish to install Chrome?  Enter y/Y or n/N or any Key?"
read -p "Install Chrome?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing Chrome"
echo "Running $ bash UbuntuClassImageUpdate-Chrome.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-Chrome.sh
echo " "
echo "----------------------------------------------------"
echo "Done running script"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

echo "Do you wish to install Apps & Tools?  Enter y/Y or n/N or any Key?"
read -p "Install Apps & Tools?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing a bunch of tools"
echo "    Check UbuntuClassImageUpdate-Apps.sh for a complete list"
echo "    bash-completion"
echo "    HTOP - https://www.makeuseof.com/tag/5-powerful-alternatives-windows-task-manager/"
echo "    GIMP - https://tecadmin.net/install-gimp-on-ubuntu/"
echo "    Audacity - http://ubuntuhandbook.org/index.php/2018/09/audacity-2-3-0-released-install-ubuntu-18-10/"
echo "    GIT - https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/"
echo "    MAKE - https://www.vim.org/ and # https://phoenixnap.com/kb/how-to-install-vim-ubuntu"
# echo "    This is in a separate script - VIM - https://www.vim.org/ and # https://phoenixnap.com/kb/how-to-install-vim-ubuntu"
echo "----------------------------------------------------"
echo "Running $ bash UbuntuClassImageUpdate-Apps.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-Apps.sh
echo " "
echo "----------------------------------------------------"
echo "Done running script"
echo "----------------------------------------------------"
elif [ $yesInstall == "n" ] || [ $yesInstall == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi

# sudo apt-get update -y;
# sudo apt-get upgrade -y;
echo "----------------------------------------------------"
echo "Done running Ubuntu Class Image Build"
echo "----------------------------------------------------"
echo " "
