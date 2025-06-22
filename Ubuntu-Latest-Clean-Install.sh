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
# Program/Design Name:		Ubuntu-Latest-Clean-Install.sh
# Description:    shell script to restore an Ubuntu Linux Class Image (with the latest Ubuntu release) after a clean Ubuntu install 
# Dependencies:   
# Revision: 
#  Revision 0.03 - Updated 06/17/2025 for SVCTE Mechatronics Class, with latest apps and tools
#  Revision 0.02 - Updated 05/04/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/04/2024
# Additional Comments: 
# https://ubuntu.com/tutorials/access-remote-desktop#1-overview
# https://askubuntu.com/questions/1369973/how-to-connect-to-ubuntu-via-vnc-from-windows
# https://www.makeuseof.com/tag/how-to-establish-simple-remote-desktop-access-between-ubuntu-and-windows/
#
# Copy This wget
# sudo wget -O Ubuntu-Latest-Clean-Install.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/Ubuntu-Latest-Clean-Install.sh 
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
echo " "
echo "  _  _  ___  ___   __  ____  __  _  _  __ "
echo " ( )( )(  ,\(   \ (  )(_  _)(  )( \( )/ _) "
echo "  )()(  ) _/ ) ) )/__\  )(   )(  )  (( (/\ "
echo "  \__/ (_)  (___/(_)(_)(__) (__)(_)\_)\__/ "
echo " Checking If The Script Logging Directory Exists "
echo "----------------------------------------------------"
echo " Do you wish to check if the Loging directory exists in $USER home?"
echo " Enter yY nN"
read -p "Check For Logging Directory In $USER Home?: " yesCheck
# elif statements
if [ $yesCheck == "y" ] || [ $yesCheck == "Y" ]
then
echo "----------------------------------------------------"
echo "getting home with cd ~"
echo "----------------------------------------------------"
echo " "
cd ~
pwd
echo "----------------------------------------------------"
echo "Running $ [ -d \"/path/dir/\" ] && echo \"Directory /path/dir/ exists.\" "
echo "----------------------------------------------------"
echo " "
if [ -d "/Script_Logs" };
    then
        echo "The Directory /Script_Logs exists"
else 
    echo " The Directory Does Not Exist"
fi
echo " "
echo "----------------------------------------------------"
echo "Done running logging Dir check"
echo "----------------------------------------------------"
elif [ $yesCheck == "n" ] || [ $yesCheck == "N" ]
then
echo "Skipping this Logging Dir Check"
else
echo "Skipping this Logging Dir Check"
fi

echo "Ready... I'm going to run "
echo "  Going to run $ sudo apt update"
echo "  Going to run $ sudo apt upgrade with -y" 
echo "----------------------------------------------------"
echo "Do you wish to run UPDATE and UPGRADE?  Enter y/Y or n/N or any Key?"
read -p "update and upgrade?: " yesInstall
# elif statements
if [ $yesInstall == "y" ] || [ $yesInstall == "Y" ]
then
echo "----------------------------------------------------"
echo "getting home with cd ~"
echo "----------------------------------------------------"
echo " "
cd ~
pwd
echo "----------------------------------------------------"
echo "Running $ update"
echo "----------------------------------------------------"
echo " "
sudo apt update
echo " "
echo "----------------------------------------------------"
echo "Done running Update"
echo "----------------------------------------------------"
echo "----------------------------------------------------"
echo "Running $ upgrade with -y"
echo "----------------------------------------------------"
echo " "
sudo apt upgrade -y
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


# sudo apt update
# sudo apt upgrade -y

echo "-------------------------------------------------------"
echo "  ___    __  _  _  ___  "
echo " (   \  /  \( \( )(  _) "
echo "  ) ) )( () ))  (  ) _) "
echo " (___/  \__/(_)\_)(___) "
echo " "
echo "----------------------------------------------------"
echo "Done running Ubuntu Latest Class Image Build"
echo " "
echo "----------------------------------------------------"
echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
echo " "
echo "List the next steps here"
