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
# Program/Design Name:		test.sh

# Copy This wget
# sudo wget -O test.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/test.sh 
# ============================================================================
echo "----------------------------------------------------"
echo "Ubuntu Test Bash Script Script" 
echo "----------------------------------------------------"
echo " "
pwd
# ls -l
ls
echo " "
echo "  ____  __  __  _  _  ___    _  _    ___    __    _  _    ___    ___ "   
echo " (  _ \(  )(  )( \( )(__ )  ( \/ )  (___)  /  )  ( \( )  (___)  (__ \ "  
echo "  )   / )(__)(  )  (  (_/    \  /    ___    )(    )  (    ___    / _/  " 
echo " (_)\_)(______)(_)\_) (_)    (__)   (___)  (__)  (_)\_)  (___)  (____)  "
echo "----------------------------------------------------"
echo "Do you wish run the Ubuntu Test Bash Script?"
echo "----------------------------------------------------"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------"
            echo "Running Ubuntu Test Bash Script" 
            echo "----------------------------------------------------"
            break;;
        No ) 
            echo "----------------------------------------------------"
            echo "Exiting Without Running" 
            echo "----------------------------------------------------"
            exit;;
    esac
done

echo "put your commands here.... "
