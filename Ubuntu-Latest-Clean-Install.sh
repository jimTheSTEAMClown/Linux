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
#  Revision 0.04 - Updated 06/26/2025 added VS Code command line install
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
echo "  ____  __  __  _  _  ___    _  _    ___    __    _  _    ___    ___ "   
echo " (  _ \(  )(  )( \( )(__ )  ( \/ )  (___)  /  )  ( \( )  (___)  (__ \ "  
echo "  )   / )(__)(  )  (  (_/    \  /    ___    )(    )  (    ___    / _/  " 
echo " (_)\_)(______)(_)\_) (_)    (__)   (___)  (__)  (_)\_)  (___)  (____)  "
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
echo "   ___  _   _  ____  ___  _  _    __    _____  ___    ____  ____  ____ "
echo "  / __)( )_( )( ___)/ __)( )/ )  (  )  (  _  )/ __)  (  _ \(_  _)(  _ \ "
echo " ( (__  ) _ (  )__)( (__  )  (    )(__  )(_)(( (_-.   )(_) )_)(_  )   / "
echo "  \___)(_) (_)(____)\___)(_)\_)  (____)(_____)\___/  (____/(____)(_)\_) "
echo " Checking If The Script Logging Directory Exists "
echo "----------------------------------------------------"
echo " Do you wish to check if the Loging directory exists in $USER home?"
echo " Enter y/Y or n/N or any Key?"
read -p "Check For Logging Directory In $USER Home?: " yesDirCheck
# elif statements
if [ "$yesDirCheck" == "y" ] || [ "$yesDirCheck" == "Y" ]
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
        if [ "$yesCreateLogDir" == "y" ] || [ "$yesCreateLogDir" == "Y" ]
            then
                echo "----------------------------------------------------"
                echo "Creating the Script_Logs Directory in $USER "
                echo "----------------------------------------------------"
                sudo mkdir Script_Logs
                if [ -d "./Script_Logs" ]; then echo "The Directory $USER/Script_Logs exists"
                # echo "----------------------------------------------------"
                fi
        elif [ "$yesCreateLogDir" == "n" ] || [ "$yesCreateLogDir" == "N" ]
            then
                echo "Skipping The Script_Logs Directory Creation"
        else
                echo "Any Key - Skipping The Script_Logs Directory Creation"
        fi
    fi
    echo "----------------------------------------------------"
elif [ "$yesDirCheck" == "n" ] || [ "$yesDirCheck" == "N" ]
    then
    echo "Skipping This Check For Logging Directory Step"
else
    echo "Any Key - Skipping This Check For Logging Directory Step"
fi

# ============================================================================
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
read -p "update and upgrade?: " yesUpdate
# elif statements
if [ "$yesUpdate" == "y" ] || [ "$yesUpdate" == "Y" ]
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
elif [ "$yesUpdate" == "n" ] || [ "$yesUpdate" == "N" ]
    then
        echo "Skipping this install"
else
    echo "Any Key - Skipping this install"
fi


# sudo apt update
# sudo apt upgrade -y

# ============================================================================
echo " "  
echo "  ____  _  _  ___  ____   __    __    __        __    ____  ____  ___ "
echo " (_  _)( \( )/ __)(_  _) /__\  (  )  (  )      /__\  (  _ \(  _ \/ __) "
echo "  _)(_  )  ( \__ \  )(  /(__)\  )(__  )(__    /(__)\  )___/ )___/\__ \ "
echo " (____)(_)\_)(___/ (__)(__)(__)(____)(____)  (__)(__)(__)  (__)  (___/ "
  
echo "Ready... I'm going to Install the follwoing Apps or Tools "
echo "-- Install Shutter, a screen capture tool"
# echo "$ sudo apt install shutter -y"

echo "----------------------------------------------------"
echo "Do you wish to Install these Apps or Tools UPDATE and UPGRADE?"  
echo "Enter y/Y or n/N or any Key?"
read -p "Install Apps & Tools?: " yesAppsInstall
# elif statements
if [ "$yesAppsInstall" == "y" ] || [ "$yesAppsInstall" == "Y" ]
    then
        echo "----------------------------------------------------"
        echo "getting home with cd ~"
        echo "----------------------------------------------------"
        echo " "
        cd ~
        pwd
        echo "----------------------------------------------------"
        echo "Installing curl"
        echo "Running $ sudo apt install curl -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install curl -y
        echo " "
        echo "----------------------------------------------------"
        echo "Installing git"
        echo "Running $ sudo apt install git -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install git -y
        echo " "
        echo "----------------------------------------------------"
        echo "Installing vim"
        echo "Running $ sudo apt install vim -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install vim -y
        echo " "
        echo "----------------------------------------------------"
        echo "Installing thony"
        echo "Running $ sudo apt install thonny -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install thonny -y
        echo " "
        echo "----------------------------------------------------"
        # Might Need To Install SNAP
        echo "Installing notepad-plus-plus"
        echo "Running $ sudo snap install notepad-plus-plus"
        echo "----------------------------------------------------"
        echo " "
        sudo snap install notepad-plus-plus
        echo " "
        echo "----------------------------------------------------"
        echo "Installing Arduino"
        echo "Running $ sudo apt install arduino -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install arduino -y
        echo " "
        echo "----------------------------------------------------"
        echo "Installing ssh"
        echo "Running $ sudo apt install openssh-server -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install openssh-server -y
        # sudo systemctl status ssh # need to figure out how to grep some stdout message, but not stop the script
        sudo ufw allow ssh
        echo " "
        
        echo "Installing net tools (for ifconfig) "
        echo "Running $ sudo apt install net-tools -y"
        echo "----------------------------------------------------"
        echo " "
        sudo apt install net-tools -y
        echo " "
        
        echo "----------------------------------------------------"
        echo "Installing Latests AMD64 Linux DEB VS Code"
        # Install dependencies for HTTPS and apt repository handling
        # sudo apt install wget gpg apt-transport-https software-properties-common -y
        # Import the Microsoft GPG key
        # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        # sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        # Enable the Visual Studio Code APT repository
        # sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        # Update package lists again to include the new VS Code repo
        # sudo apt update
        # Install Visual Studio Code
        # sudo apt install code -y
        # ✅ Check Installation
        # Run this command to verify the install:
        # code --version
        echo "----------------------------------------------------"
        echo " "
        echo " Install dependencies for HTTPS and apt repository handling "
        sudo apt install wget gpg apt-transport-https software-properties-common -y
        
        echo " Import the Microsoft GPG key"
        # wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
        # sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        
        echo " Enable the Visual Studio Code APT repository"
        # sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
        echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
        echo " Update package lists again to include the new VS Code repo "
        sudo apt update
        # E: Conflicting values set for option Signed-By regarding source https://packages.microsoft.com/repos/code/ stable: /etc/apt/trusted.gpg.d/packages.microsoft.gpg != /usr/share/keyrings/microsoft.gpg
        # E: The list of sources could not be read.
        
        echo " Install Visual Studio Code"
        # sudo apt install code -y
        # ✅ Check Installation
        # Run this command to verify the install:
        code --version


        
        echo " "
        echo "----------------------------------------------------"
        # https://code.visualstudio.com/Download#
        # https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
        
        echo "Done running App installs and updates"
        echo "----------------------------------------------------"
        echo "----------------------------------------------------"
elif [ "$yesAppsInstall" == "n" ] || [ "$yesAppsInstall" == "N" ]
    then
        echo "Skipping this install"
        echo "You can install them individually using the following commands: "
        echo "sudo apt install curl -y"
        echo "sudo apt install git -y"
        echo "sudo apt install openssh-server -y"
        echo "sudo apt install net-tools -y"
        echo "sudo apt install vim -y"
        echo "sudo apt install thonny -y"
        echo "sudo snap install notepad-plus-plus"
        echo "sudo apt install arduino -y"
        
else
    echo "Any Key - Skipping this install"
fi

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
