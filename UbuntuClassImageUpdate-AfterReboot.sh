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
# Program/Design Name:		UbuntuClassImageUpdate-AfterReboot.sh
# Description:    2nd shell script, run after reboot, to restore an Ubuntu Linux 
#   Class Image after a clean Ubuntu installl 
# Dependencies:   
# Revision: 
#  Revision 0.02 - Updated 04/04/2020 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 04/04/2020
# Additional Comments: 
# see https://www.answers.com/Q/How_do_you_make_a_yes_no_command_in_cmd to add more features
# ============================================================================
echo "----------------------------------------------------"
echo "Ubuntu Class Image Update Script Number 2" 
echo "Run after you have run UbuntuClassImageUpdate.sh and then rebooted"
echo "----------------------------------------------------"
echo " "
pwd
# ls -l
ls
echo " "
echo "----------------------------------------------------"
echo "Do you wish run the 2nd (after reboot) Ubuntu Class Image Update?"
echo "----------------------------------------------------"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------"
            echo "Running After Reboot 2nd Ubuntu Class Image Update" 
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

echo "Do you wish to install VIM?  Enter y/Y or n/N or any Key?"
read -p "Install VIM?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "Installing VIM"
echo "Running $ bash UbuntuClassImageUpdate-VIM.sh"
echo "----------------------------------------------------"
echo " "
bash UbuntuClassImageUpdate-VIM.sh
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

sudo apt-get update -y
sudo apt-get upgrade -y
echo "----------------------------------------------------"
echo "Done running 2nd After Reboot Ubuntu Class Image Build"
echo "----------------------------------------------------"
echo " "
