#! /bin/sh
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

pwd
ls -l

echo "----------------------------------------------------"
echo "Running Update"
echo "----------------------------------------------------"
echo " "
# sudo apt-get update -y
echo " "
echo "----------------------------------------------------"
echo "Done running update"
echo "----------------------------------------------------"
echo " "
echo "Do you wish to install this program?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "you said Yes"; break;;
        No ) exit;;
    esac
done
echo "----------------------------------------------------"
echo "Running Upgrade with -y"
echo "----------------------------------------------------"
echo " "
# sudo apt-get upgrade -y
echo " "
echo "----------------------------------------------------"
echo "Done running Upgrade"
echo "----------------------------------------------------"
echo " "


echo "----------------------------------------------------"
echo "Done running Ubuntu Class Image Build"
echo "----------------------------------------------------"
echo " "
