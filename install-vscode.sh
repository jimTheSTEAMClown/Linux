#!/bin/bash
# ============================================================================
# install-vscode.sh
# Installs the latest Visual Studio Code on Ubuntu using only CLI tools.
# Author: STEAM Clown - www.steamclown.org
# ============================================================================
# Usage:
#   chmod +x install-vscode.sh
#   ./install-vscode.sh
# ============================================================================
# wget sudo wget -O vs-Install.sh https://raw.githubusercontent.com/jimTheSTEAMClown/Linux/refs/heads/master/install-vscode.sh
# Stuff to add:
# 1) test for latest vs code build 
# curl -s https://update.code.visualstudio.com/api/update/darwin/stable/latest | grep -oP '"version":"\K[^"]+'
#
# 2) add option to check for latest, remove current build, install new.

echo '  _  _  ___     ___  _____  ____  ____  '
echo ' ( \/ )/ __)   / __)(  _  )(  _ \( ___) '
echo '  \  / \__ \  ( (__  )(_)(  )(_) ))__)  '
echo '   \/  (___/   \___)(_____)(____/(____) '

echo "----------------------------------------------------"
echo "Do you wish run the Ubuntu Class Image Update?"
echo "----------------------------------------------------"
select yn in "Check_Version" "Remove_VS_Code" "Install_VS_Code" "Quit"; do
    case $yn in
        Check_Version ) 
            echo "----------------------------------------------------"
            echo "Running VS Code vesrion Check"
            echo "Installed Version..."
            code --version
            echo "Latest Build..."
            curl -s https://update.code.visualstudio.com/api/update/darwin/stable/latest | grep -oP '"version":"\K[^"]+'
            echo "----------------------------------------------------"
            break;;
        Remove_VS_Code ) 
            echo "----------------------------------------------------"
            echo "Remove VS Code" 
            echo "----------------------------------------------------"
            break;;
        Install_VS_Code ) 
            echo "----------------------------------------------------"
            echo "EInstall VS Code" 
            echo "----------------------------------------------------"
            break;;
        Quit ) 
            echo "----------------------------------------------------"
            echo "Exiting Without Update" 
            echo "----------------------------------------------------"
            exit;;
    esac
done

echo "Did It"
exit -1

echo "==================================================="
echo "  Visual Studio Code Installation Script for Ubuntu"
echo "==================================================="
# Step 0: Clean up any conflicting GPG keys
echo "[Step 0] Run update / upgrade..."
sudo apt update
sudo apt upgrade - y

# Step 1: Clean up any conflicting GPG keys
echo "[Step 1] Removing conflicting GPG keys if present..."
sudo rm -f /etc/apt/trusted.gpg.d/packages.microsoft.gpg

# Step 2: Update package index and install required tools
echo "[Step 2] Updating package index and installing dependencies..."
sudo apt update
sudo apt install -y wget gpg apt-transport-https software-properties-common

# Step 3: Download and install the Microsoft GPG key
echo "[Step 3] Downloading and registering the Microsoft GPG key..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null

# Step 4: Add the Visual Studio Code APT repository
echo "[Step 4] Adding the VS Code repository to sources.list.d..."
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/code stable main" | \
  sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# Step 5: Update the package list again
echo "[Step 5] Updating package list to include the VS Code repository..."
sudo apt update

# Step 6: Install Visual Studio Code
echo "[Step 6] Installing Visual Studio Code..."
sudo apt install -y code

# Step 7: Verify installation
echo "[Step 7] Verifying installation..."
code --version && echo "✅ VS Code installed successfully!" || echo "❌ VS Code installation failed."

echo "==================================================="
echo "       Done! You can now run VS Code with 'code'"
echo "==================================================="
