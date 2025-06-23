#! /bin/bash
# ============================================================================
# shell script to test bash command line
# Source: STEAM Clown - www.steamclown.org 
# GitHub: https://github.com/jimTheSTEAMClown/Linux
# Hacker: Jim Burnham - STEAM Clown, Engineer, Maker, Propmaster & Adrenologist 
# This example code is licensed under the CC BY-NC-SA 4.0, GNU GPL and EUPL
# https://creativecommons.org/licenses/by-nc-sa/4.0/
# https://www.gnu.org/licenses/gpl-3.0.en.html
# https://eupl.eu/
# Program/Design Name:		gowinInstall.sh
#
# Copy This wget
# sudo wget -O gowinInstall.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/gowinInstall.sh 
# ============================================================================
if [-z "$1" ]; then
  echo "----------------------------------------------------"
  echo " __  __  ___    __    ___  ____ "
  echo " (  )(  )/ __)  /__\  / __)( ___) "
  echo "  )(__)( \__ \ /(__)\( (_-. )__) "
  echo " (______)(___/(__)(__)\___/(____) " 
  echo "Please provide the HTML link to the gowan Linux TAR File"
  echo "See the instalation instructions, but the usage will be "
  echo "something like this:"
  echo "Usage: $0 https://cdn.gowinsemi.com.cn/Gowin_V1.9.11.01_Education_Linux.tar.gz"
  # exit 1
  return
fi
HTML_PATH = "$1"
if [ ! -f "HTML_PATH" ]; then
  echo "----------------------------------------------------"
  echo " _  _  _____    _   _  ____  __  __  __      ____  ____  __    ____ "
  echo " ( \( )(  _  )  ( )_( )(_  _)(  \/  )(  )    ( ___)(_  _)(  )  ( ___) "
  echo " )  (  )(_)(    ) _ (   )(   )    (  )(__    )__)  _)(_  )(__  )__) "
  echo " (_)\_)(_____)  (_) (_) (__) (_/\/\_)(____)  (__)  (____)(____)(____) "
  echo " "
  echo "Error: The HTML Path to the TAR File does not exist"
  echo "Error: Path not found at $HTML_PATH"
  # exit 1
  return
fi


echo "  ____  __  __  _  _     ___  _____  _    _  ____  _  _    ____  _  _  ___  ____   __    __    __ "
echo " (  _ \(  )(  )( \( )   / __)(  _  )( \/\/ )(_  _)( \( )  (_  _)( \( )/ __)(_  _) /__\  (  )  (  ) "
echo "  )   / )(__)(  )  (   ( (_-. )(_)(  )    (  _)(_  )  (    _)(_  )  ( \__ \  )(  /(__)\  )(__  )(__ "
echo " (_)\_)(______)(_)\_)   \___/(_____)(__/\__)(____)(_)\_)  (____)(_)\_)(___/ (__)(__)(__)(____)(____) "
echo "----------------------------------------------------"
echo "Ubuntu Gowin Linux Tools Install Script" 
echo "----------------------------------------------------"
echo " "
cd $USER
pwd
ls -l
echo "----------------------------------------------------"
# ============================================================================
echo " "
echo "   ___  _   _  ____  ___  _  _     ___  _____  _    _  ____  _  _ "
echo "  / __)( )_( )( ___)/ __)( )/ )   / __)(  _  )( \/\/ )(_  _)( \( ) "
echo " ( (__  ) _ (  )__)( (__  )  (   ( (_-. )(_)(  )    (  _)(_  )  ( "
echo "  \___)(_) (_)(____)\___)(_)\_)   \___/(_____)(__/\__)(____)(_)\_) "
echo " Checking If The $USER/gowin Directory Exists "
echo "----------------------------------------------------"
echo " Do you wish to check if the gowin directory exists in $USER home?"
echo " If it does, do you want to back it up?"
echo " Enter y/Y or n/N or any Key?"
read -p "Check & Backup the $USER/gowin Directory In $USER Home?: " yesBackUpGowin
# elif statements
if [ "$yesBackUpGowin == "y" ] || [ "$yesBackUpGowin" == "Y" ]
    then
    echo "----------------------------------------------------"
    echo "getting home with cd ~"
    echo "----------------------------------------------------"
    echo " "
    cd ~
    pwd
    ls -l
    echo "----------------------------------------------------"
    if [ -d "$USER/gowin" ];
        then
            echo "The Directory $USER/gowin exists"
            echo "Creating a backup in $USER/gowinBackUp"
            sudo mv gowin gowinBackUp 
    fi
    # ============================================================================
    echo " "  
    echo "   ___  ____  ____    __   ____  ____    ____  ____  ____ "
    echo "  / __)(  _ \( ___)  /__\ (_  _)( ___)  (  _ \(_  _)(  _ \ "
    echo " ( (__  )   / )__)  /(__)\  )(   )__)    )(_) )_)(_  )   / "
    echo "  \___)(_)\_)(____)(__)(__)(__) (____)  (____/(____)(_)\_) "
          
    echo " The $USER/gowin Directory Does Not Exist"
    echo " Create this gowin directory in $USER/gowin"
    sudo mkdir -p /home/$USER/gowin
    echo "----------------------------------------------------"
elif [ "$yesBackUpGowin" == "n" ] || [ "$yesBackUpGowin" == "N" ]
    then
    echo "Skipping This Check For gowin Directory Step"
    if [ -d "$USER/gowin" ];
        then
            echo "The Directory $USER/gowin exists"
            echo "Exiting this shell scripts"
            # exit;; 
            return
    fi
else
    echo "Any Key - Skipping This Check For gowin Directory Step"
    # exit 1
    return
fi

# https://cdn.gowinsemi.com.cn/Gowin_V1.9.11.01_Education_Linux.tar.gz
sudo wget -O /home/$USER/gowin/Gowin_Latest.tar.gz $HTML_PATH
cd /home/$USER/gowin
sudo tar -xvzf Gowin_Latest.tar.gz
sudo rm Gowin_Latest.tar.gz
ls -l
# is there a check to make sure we got the right files installed?
