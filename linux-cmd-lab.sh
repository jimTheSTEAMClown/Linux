#! /bin/sh

# ============================================================================
# shell script to create command line lab structure
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/Linux
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		linux-cmd-lab.sh
# Description:    shell script to WGET the files to setup and update a clean Raspberry Pi Image 
# Dependencies:   
# Revision: 
#  
#  Revision 0.02 - Updated 03/10/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 03/10/2024
# Additional Comments:
# ============================================================================
                                                                                           
# copy to your /home/<USER> directory
# sudo wget -O ./linux-cmd-lab.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/linux-cmd-lab.sh
# sudo chmod 755 ./linux-cmd-lab.sh
# sudo cat ./linux-cmd-lab.sh
# ============================================================================
cd ~
mkdir linuxCommandLab
mkdir ./linuxCommandLab/labTxtFiles
sudo wget -O ./linuxCommandLab/labTxtFiles/my_txt_file_1.txt https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/linux_cmd_lab_my_file_1.txt
sudo wget -O ./linuxCommandLab/labTxtFiles/my_txt_file_2.txt https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/linux_cmd_lab_my_file_2.txt
sudo wget -O ./linuxCommandLab/labTxtFiles/my_txt_file_3.txt https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/linux_cmd_lab_my_file_3.txt
