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
# Program/Design Name:		Ubuntu-24.04-New-Clean-Install.sh
# Description:    shell script to restore an Ubuntu Linux Class Image after a clean Ubuntu installl 
# Dependencies:   
# Revision: 
#  Revision 0.03 - Updated 07/10/2026 for ROS2 Workshop
#  Revision 0.02 - Updated 05/04/2024 for SVCTE Mechatronics Class
#  Revision 0.01 - Created 05/04/2024
# Additional Comments: 
# https://ubuntu.com/tutorials/access-remote-desktop#1-overview
# https://askubuntu.com/questions/1369973/how-to-connect-to-ubuntu-via-vnc-from-windows
# https://www.makeuseof.com/tag/how-to-establish-simple-remote-desktop-access-between-ubuntu-and-windows/
#
# Copy This wget
# sudo wget -O Ubuntu-24.04-New-Clean-Install.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/master/Ubuntu-24.04-New-Clean-Install.sh 
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
# LOGGING SETUP
# All output goes to terminal AND to a timestamped log file in home directory.
# Uses 'tee' so you see everything live in the terminal while it is captured.
# Log file:  ~/log-Auto-Laptop-Ubuntu-Desk-24.04-Tools-Apps-Install-YYYYMMDD-HHMMSS.log
# ============================================================================
LOG_FILE="$HOME/log-Auto-Laptop-Ubuntu-Desk-24.04-Tools-Apps-Install-$(date +%Y%m%d-%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "============================================================"
echo "  LOGGING ENABLED"
echo "  Log file: $LOG_FILE"
echo "  All terminal output is being saved to that file."
echo "============================================================"
echo " "

# ============================================================================
# PRE-FLIGHT BOOTSTRAP
# Install bare-minimum tools needed by this script BEFORE any prompted steps.
# These are not guaranteed on a brand new Ubuntu 24.04 Desktop image and are
# required for later steps to succeed.
#
# NOTE: Uses apt-get (not apt) throughout this script.
#   apt       = human-friendly interactive tool (produces noisy warnings in
#               scripts: "WARNING: apt does not have a stable CLI interface")
#   apt-get   = the correct scriptable interface; no warnings, stable output

# ============================================================================
echo " "
echo "  _  _  ___  ___   __  ____  __  _  _  __ "
echo " ( )( )(  ,\(   \ (  )(_  _)(  )( \( )/ _) "
echo "  )()(  ) _/ ) ) )/__\  )(   )(  )  (( (/\ "
echo "  \__/ (_)  (___/(_)(_)(__) (__)(_)\_)\__/ "
echo "----------------------------------------------------"
echo "Ready... I'm going to run "

echo "----------------------------------------------------"
echo "getting home with cd ~"
echo "----------------------------------------------------"
echo " "
cd ~
pwd
echo "----------------------------------------------------"
echo "Running $ update"
echo " "
echo "============================================================"
echo "PRE-FLIGHT BOOTSTRAP"
echo "  Installing script dependencies on fresh Ubuntu 24.04..."
echo "  Using apt-get (script-safe interface, no apt warnings)"
echo "============================================================"
echo "STEP 1 - UPDATE, UPGRADE, AND AUTOREMOVE"
echo "  Running: sudo apt-get update"
echo "  Running: sudo apt-get upgrade -y"
echo "  Running: sudo apt-get autoremove -y"
echo "  Running: sudo apt-get autoclean"
echo "============================================================"
  sudo apt-get update         # sync package lists from repos
  sudo apt-get upgrade -y     # apply all available upgrades
  sudo apt-get autoremove -y  # drop orphaned dependencies left by upgrades
  sudo apt-get autoclean      # purge stale .deb cache files
  sudo apt-get update         # re-sync so next install has clean fresh index
echo " "
echo "----------------------------------------------------"
echo "Done running update upgrade"
echo "----------------------------------------------------"




echo "Now I'm going to install some standard apps that are not part"
echo "of the standard Ubuntu build, but I find you will use them lots..."
echo "I'm installing:"
echo " - curl"
echo " - git"
echo " - ssh"
echo " - openssh-server"
echo " - PuTTY"
echo " - net-tools"

echo " - ubuntu-gnome-desktop"

echo " "

echo "----------------------------------------------------"
echo "Installing curl"
echo "Running $ sudo apt install curl -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get install curl -y
echo " "
echo "Installing git"
echo "Running $ sudo apt install git -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get install git -y
echo " "
echo "Installing ssh"
echo "Running $ sudo apt install ssh -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get install ssh -y
echo " "
echo "Installing openssh"
echo "Running $ sudo apt install openssh-server -y"
echo "----------------------------------------------------"
echo " "
sudo apt-get install openssh-server -y
# sudo systemctl status ssh
sudo ufw allow ssh
echo " "
echo "Installing snapd"
sudo apt-get install snapd -y
echo " "
echo "  Waiting for snapd to be ready..."
sudo systemctl enable snapd
sudo systemctl start snapd
sudo snap wait system seed.loaded
echo "  snapd is ready"
echo " "
echo "Installing putty"
echo "Running $ sudo apt install putty -y"
echo "----------------------------------------------------"
echo " "
sudo apt install putty -y
echo " "
echo "Installing net tools (for ifconfig) "
echo "Running $ sudo apt install net-tools -y"
echo "----------------------------------------------------"
echo " "
sudo apt install net-tools -y
echo " "
echo "----------------------------------------------------"
echo "Done running App installs and updates"
echo "----------------------------------------------------"


echo "----------------------------------------------------"
echo " "
sudo apt install ubuntu-gnome-desktop -y
gsettings set org.gnome.desktop.session idle-delay 800
gsettings set org.gnome.desktop.screensaver lock-delay 900

# gsettings set org.gnome.settings-daemon.plugins.power sleep-display-ac 600
# gsettings set org.gnome.settings-daemon.plugins.power sleep-display-battery 600
# gsettings set org.gnome.desktop.session idle-delay 600
# gsettings set org.gnome.desktop.screensaver idle-activation-enabled 'true'
# gsettings set org.gnome.desktop.screensaver lock-enabled 'true'
# gsettings set org.gnome.desktop.screensaver lock-delay 900

sudo apt install vim -y
sudo apt install thonny -y
# Installing Visual Studion Code
sudo snap install --classic code


echo " "
echo "----------------------------------------------------"
echo "Done running STUFF"
echo "----------------------------------------------------"

# ============================================================================
# STEP 3 - PYTHON TOOLS
# Python is the primary language for Pi robotics and student curriculum.
#
#   python3-pip    - Python package manager
#                    NOTE: Ubuntu 24.04 uses PEP 668 externally-managed env.
#                    Use '--break-system-packages' when running pip directly,
#                    or prefer apt-installed python3-* packages where available.
#   python3-venv   - Virtual environment support; best practice for pip installs
#   python3-dev    - Python C headers; required by some native pip packages
#   build-essential - gcc/g++/make; required for compiling native Python modules
#                     and by PlatformIO toolchain (installed in Step 11)
# ============================================================================
echo " "
echo "============================================================"
echo "STEP 3 - PYTHON TOOLS"
echo "  Installing:"
echo "    - python3-pip    (pip package manager)"
echo "    - python3-venv   (virtual environment support)"
echo "    - python3-dev    (Python C headers for native packages)"
echo "    - build-essential (gcc/make toolchain)"
echo "  NOTE: Ubuntu 24.04 PEP 668 - prefer apt-get python3-* packages"
echo "        or use venv / '--break-system-packages' with pip"
echo "============================================================"

    echo " "
    echo "----------------------------------------------------"
    echo "Installing python3-pip - Python 3 package manager"
    echo "Running: sudo apt-get install python3-pip -y"
    echo "----------------------------------------------------"
    sudo apt-get install python3-pip -y

    echo " "
    echo "----------------------------------------------------"
    echo "Installing python3-venv - Python virtual environments"
    echo "Running: sudo apt-get install python3-venv -y"
    echo "----------------------------------------------------"
    sudo apt-get install python3-venv -y

    echo " "
    echo "----------------------------------------------------"
    echo "Installing python3-dev - Python C headers"
    echo "  Required by some pip packages that compile native code"
    echo "Running: sudo apt-get install python3-dev -y"
    echo "----------------------------------------------------"
    sudo apt-get install python3-dev -y

    echo " "
    echo "----------------------------------------------------"
    echo "Installing build-essential - gcc/g++/make toolchain"
    echo "  Required for compiling native Python modules"
    echo "  Also required by PlatformIO firmware toolchain (Step 11)"
    echo "Running: sudo apt-get install build-essential -y"
    echo "----------------------------------------------------"
    sudo apt-get install build-essential -y

    echo " "
    echo "----------------------------------------------------"
    echo "Done: PYTHON TOOLS"
    echo "----------------------------------------------------"
    python3 -V
    pip3 -V


# sudo apt update
# sudo apt upgrade -y

echo "-------------------------------------------------------"
echo "  ___    __  _  _  ___  "
echo " (   \  /  \( \( )(  _) "
echo "  ) ) )( () ))  (  ) _) "
echo " (___/  \__/(_)\_)(___) "
echo " "
echo "----------------------------------------------------"
echo "Done running Apps for Ubuntu 24.04.4 Class Image Build"
echo " "
echo "----------------------------------------------------"
echo "  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ "
echo " ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) "
echo "  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ "
echo " (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ "
echo " "
echo "List the next steps here"
