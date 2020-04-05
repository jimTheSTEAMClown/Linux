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
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            break;;
        No ) 
            echo "----------------------------------------------------"
            echo "Exiting Without Update" 
            echo "----------------------------------------------------"
            exit;;
    esac
done

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

echo "Do you wish to run this script?"
read -p "VLC: " yesVLC
# elif statements
if [ $yesVLC == "y" || $yesVLC == "Y" ]
then
echo You may go to the party.
elif [ $yesVLC == "n" || $yesVLC == "N" ]
then
echo You may go to the party but be back before midnight.
else
echo You may not go to the party.
fi


# sudo apt-get update -y;
# sudo apt-get upgrade -y;
echo "----------------------------------------------------"
echo "Done running Ubuntu Class Image Build"
echo "----------------------------------------------------"
echo " "
