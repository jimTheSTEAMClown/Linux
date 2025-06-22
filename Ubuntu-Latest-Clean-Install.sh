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
# https://patorjk.com/software/taag/#p=display&f=Bulbhead&t=Next%20Steps%0A
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
echo " # ============================================================================ "
echo " "
echo "  _  _  ___  ___   __  ____  __  _  _  __ "
echo " ( )( )(  ,\(   \ (  )(_  _)(  )( \( )/ _) "
echo "  )()(  ) _/ ) ) )/__\  )(   )(  )  (( (/\ "
echo "  \__/ (_)  (___/(_)(_)(__) (__)(_)\_)\__/ "

# ============================================================================
echo " # ============================================================================ "
echo " "
echo "   ___  _   _  ____  ___  _  _    __    _____  ___    ____  ____  ____ "
echo "  / __)( )_( )( ___)/ __)( )/ )  (  )  (  _  )/ __)  (  _ \(_  _)(  _ \ "
echo " ( (__  ) _ (  )__)( (__  )  (    )(__  )(_)(( (_-.   )(_) )_)(_  )   / "
echo "  \___)(_) (_)(____)\___)(_)\_)  (____)(_____)\___/  (____/(____)(_)\_) "
echo " Checking If The Script Logging Directory Exists "
echo "----------------------------------------------------"
echo " Do you wish to check if the Loging directory exists in $USER home?"
echo " Enter y/Y or n/N or any Key?"
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
echo "Running $ [ -d \"/path/dir/\" ] "
echo "----------------------------------------------------"
echo " "
    if [ -d "./Script_Logs" ];
        then
            echo "The Directory $USER/Script_Logs exists"
    else 
# ============================================================================
echo " # ============================================================================ "
echo " "  
echo "   ___  ____  ____    __   ____  ____    ____  ____  ____ "
echo "  / __)(  _ \( ___)  /__\ (_  _)( ___)  (  _ \(_  _)(  _ \ "
echo " ( (__  )   / )__)  /(__)\  )(   )__)    )(_) )_)(_  )   / "
echo "  \___)(_)\_)(____)(__)(__)(__) (____)  (____/(____)(_)\_) "
      
        echo " The Directory Does Not Exist"
        echo " Do you wish to create this directory in $USER home?"
        echo " Enter y/Y or n/N or any Key?"
        read -p "Check For Creating Directory In $USER Home?: " yesCreateLogDir
        # if statements to check if you want to create the direcotry
        if [ $yesCreateLogDir == "y" ] || [ $yesCreateLogDir == "Y" ]
            then
                echo "----------------------------------------------------"
                echo "Creating the Script_Logs Directory in $USER "
                echo "----------------------------------------------------"
                sudo mkdir Script_Logs
                if [ -d "./Script_Logs" ]; then echo "The Directory $USER/Script_Logs exists"
                echo "----------------------------------------------------"
                fi
        elif [ $yesCreateLogDir == "n" ] || [ $yesCreateLogDir == "N" ]
            then
                echo "Skipping The Script_Logs Directory Creation"
        else
                echo "Should Not See This Message"
        fi
    fi
    echo " "
    echo "----------------------------------------------------"
    echo "Done running logging Dir check"
    echo "----------------------------------------------------"
elif [ $yesCheck == "n" ] || [ $yesCheck == "N" ]
then
echo "Skipping this Logging Dir Check"
else
echo "Should Not See This Message"
fi
echo " # ============================================================================ "
echo " "  
echo "  __  __  ____  ____    __   ____  ____      _    __  __  ____   ___  ____    __    ____  ____ "
echo " (  )(  )(  _ \(  _ \  /__\ (_  _)( ___)    / )  (  )(  )(  _ \ / __)(  _ \  /__\  (  _ \( ___) "
echo "  )(__)(  )___/ )(_) )/(__)\  )(   )__)    / /    )(__)(  )___/( (_-. )   / /(__)\  )(_) ))__) "
echo " (______)(__)  (____/(__)(__)(__) (____)  (_/    (______)(__)   \___/(_)\_)(__)(__)(____/(____) "
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
