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
ls -l
echo " "
echo "----------------------------------------------------"
echo "Do you wish run the Ubuntu Class Image Update?"
echo "----------------------------------------------------"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "Running Ubuntu Class Image Update"; 
            echo "----------------------------------------------------";
            break;;
        No ) 
            echo "----------------------------------------------------";
            echo "Exiting Without Update"; 
            echo "----------------------------------------------------";
            exit;;
    esac
done
# ============================================================================
# update the software install to update with main universe restricted multiverse
# echo "----------------------------------------------------"
# echo "listing which software repositories are used - main universe restricted multiverse"
# echo "----------------------------------------------------"
# sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup
$ grep ^[^#] /etc/apt/sources.list
# sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"


echo "Do you wish to run $ sudo apt-get update -y?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "Running Update with -y";
            echo "----------------------------------------------------";
            echo " ";
            sudo apt-get update -y;
            echo " ";
            echo "----------------------------------------------------";
            echo "Done running Update";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done

echo "Do you wish to run $ sudo apt-get upgrade -y?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "Running Upgrade with -y";
            echo "----------------------------------------------------";
            echo " ";
            sudo apt-get upgrade -y;
            echo " ";
            echo "----------------------------------------------------";
            echo "Done running Upgrade";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done

echo "Do you wish to install the following tools or apps?"
echo "Apps List"
# tps://www.vlchelp.com/install-ubuntu-linux/
echo "VLC"

# https://www.tixati.com/download/linux.html
# http://elinuxbook.com/install-tixati-torrent-client-in-ubuntu-16-04-a-best-torrent-software-for-linux/
echo "tixati"

# https://code.visualstudio.com/download
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
echo "Visual Studio Code"

echo "Chrome"

echo "Do you wish to install VLC?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "installing VLC";
            echo "----------------------------------------------------";
            echo " ";
            # sudo snap install VLC;
            sudo apt-get install vlc;
            echo " ";
            echo "----------------------------------------------------";
            echo "Done Installing VLC";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done
echo "Do you wish to install Tixati?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "installing tixati";
            echo "----------------------------------------------------";
            echo " ";
            sudo wget https://download2.tixati.com/download/tixati_2.72-1_amd64.deb;
            sudo dpkg -i tixati_2.72-1_amd64.deb;
            sudo dpkg -l tixati;
            echo " ";
            echo "----------------------------------------------------";
            echo "Done Installing tixati";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done
echo "Do you wish to install Visual Studio Code?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )             
            echo "----------------------------------------------------";
            echo "installing Visual Studio Code";
            echo "----------------------------------------------------";
            echo " ";
            sudo apt update;
            sudo apt install software-properties-common apt-transport-https wget;
            wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -;
            sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main";
            sudo apt update;
            sudo apt install code;
            # code -V
            echo " ";
            echo "----------------------------------------------------";
            echo "Done Installing Visual Studio Code";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done
echo "Do you wish to install Chrome?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )             
            echo "----------------------------------------------------";
            echo "installing Chrome";
            echo "----------------------------------------------------";
            echo " ";
            wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
            sudo apt install ./google-chrome-stable_current_amd64.deb;
            cat /etc/apt/sources.list.d/google-chrome.list;
            echo " ";
            echo "----------------------------------------------------";
            echo "Done Installing Chrome";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done

echo "Do you wish to Install these tools or apps?"
# https://www.wikihow.com/Change-Themes-on-Ubuntu-with-Gnome-Tweak-Tool
#https://itsfoss.com/gnome-tweak-tool/
echo "gnome-tweak-tools"

select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            echo "----------------------------------------------------";
            echo "Installing gnome-tweak-tools";
            echo "----------------------------------------------------";
            echo " ";
            sudo apt-get install gnome-tweak-tool;
            sudo add-apt-repository ppa:webupd8team/gnome3;
            sudo apt-get update;
            sudo apt-get install gnome-shell-extensions-user-themes -y;
            gnome-shell --version;
            
            echo " ";
            echo "----------------------------------------------------";
            echo "Done Installing gnome-tweak-tools";
            echo "----------------------------------------------------";
            break;;
        No ) break;;
    esac
done



echo "----------------------------------------------------"
echo "Done running Ubuntu Class Image Build"
echo "----------------------------------------------------"
echo " "
