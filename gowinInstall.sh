#!/bin/bash
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
echo "$1"
if [ -z "$1" ]; then
  echo "----------------------------------------------------"
  echo " __  __  ___    __    ___  ____ "
  echo " (  )(  )/ __)  /__\  / __)( ___) "
  echo "  )(__)( \__ \ /(__)\( (_-. )__) "
  echo " (______)(___/(__)(__)\___/(____) " 
  echo "Please provide the HTML link to the gowan Linux TAR File"
  echo "See the instalation instructions, but the usage will be "
  echo "something like this:"
  echo "Usage: $0 https://cdn.gowinsemi.com.cn/Gowin_V1.9.11.01_Education_Linux.tar.gz"
  exit 1
  # return
  echo "Usage is OK"
fi
HTML_PATH="$1"
echo "Checking URL: $HTML_PATH"
# Create a temp file to hold the HTTP status
TMP_HTTP_STATUS=$(mktemp)

# Run curl in background and write status to temp file
curl -s -o /dev/null -w "%{http_code}" "$HTML_PATH" > "$TMP_HTTP_STATUS" &
CURL_PID=$!

# Spinner while curl runs
echo -n "Connecting"
while kill -0 $CURL_PID 2>/dev/null; do
  echo -n "."
  sleep 0.3
done
echo ""

# Read the result
HTTP_STATUS=$(cat "$TMP_HTTP_STATUS")
rm "$TMP_HTTP_STATUS"  # clean up temp file

echo "$HTTP_STATUS"
if [ "$HTTP_STATUS" -eq 200 ]; then
  echo "----------------------------------------------------"
  echo "✅ - HTTP Path exists"
  echo "----------------------------------------------------"
else
  echo "----------------------------------------------------"
  echo "❌ - Error: The HTML Path to the TAR File does not exist"
  echo "❌ - Error: Path not found at $HTML_PATH"
  echo "Status code: $HTTP_STATUS"
  echo "URL: $HTML_PATH"
  echo "----------------------------------------------------"
  exit 1
fi


echo "  ____  __  __  _  _     ___  _____  _    _  ____  _  _    ____  _  _  ___  ____   __    __    __ "
echo " (  _ \(  )(  )( \( )   / __)(  _  )( \/\/ )(_  _)( \( )  (_  _)( \( )/ __)(_  _) /__\  (  )  (  ) "
echo "  )   / )(__)(  )  (   ( (_-. )(_)(  )    (  _)(_  )  (    _)(_  )  ( \__ \  )(  /(__)\  )(__  )(__ "
echo " (_)\_)(______)(_)\_)   \___/(_____)(__/\__)(____)(_)\_)  (____)(_)\_)(___/ (__)(__)(__)(____)(____) "
echo "----------------------------------------------------"
echo "Ubuntu Gowin Linux Tools Install Script" 
echo "----------------------------------------------------"
echo " "
echo " Getting ready to install the latest Gowin Tools & Software. "
echo " The path to the latest tools you provided is the following: "
echo " $HTML_PATH "
echo " "
echo "----------------------------------------------------"
echo "The following steps will be proformed:"
echo " Step #1 - Checking If The /home/$USER/gowin Directory Exists "
echo "      If it exists, a backup will be made, and a new /home/$USER/gowin "
echo "      will be created. Then the latest Gowin tools and software will be installed. "
echo " Step #2 - A Backup of the current /home/$USER/gowin will be created."
echo "      as /home/$USER/gowinBackUp"
echo " Step #3 - A new /home/$USER/gowin directory will be created."
echo " Step #4 - the TAR file found at:"
echo " $HTML_PATH "
echo "      will be copied. (wget) "
echo " Step #5 - the TAR file Gowin_Latest.tar.gz will be extracted, and then deleted "
echo "----------------------------------------------------"
echo " Enter y/Y or n/N or any Key?"
read -p "Install Latest Gowin release in /home/$USER/gowin?: " yesBackUpInstallGowin
# elif statements
if [ "$yesBackUpInstallGowin" == "y" ] || [ "$yesBackUpInstallGowin" == "Y" ]; then
  echo "----------------------------------------------------"
  echo "cd to /home/$USER "
  cd
  pwd
  echo "----------------------------------------------------"
  if [ -d "/home/$USER/gowin" ];
      then
          echo "The Directory /home/$USER/gowin exists"
          echo "Creating a backup in /home/$USER/gowinBackUp_$(date +%Y%m%d_%H%M%S)"
          sudo mv /home/$USER/gowin /home/$USER/gowinBackUp_$(date +%Y%m%d_%H%M%S) 
  fi
  echo " Creating a new /home/$USER/gowin Directory."
  sudo mkdir -p /home/$USER/gowin
  echo "----------------------------------------------------"
elif [ "$yesBackUpInstallGowin" == "n" ] || [ "$yesBackUpInstallGowin" == "N" ]
    then
    echo "Skipping This Check For gowin Directory Step"
    if [ -d "/home/$USER/gowin" ];
        then
            echo "The Directory /home/$USER/gowin exists"
            echo "Exiting this shell scripts"
            exit 1
            # return
    fi
else
    echo "Any Key - Skipping This Check For gowin Directory Step"
    exit 1
    # return
fi

# https://cdn.gowinsemi.com.cn/Gowin_V1.9.11.01_Education_Linux.tar.gz
sudo wget -O /home/$USER/gowin/Gowin_Latest.tar.gz $HTML_PATH
cd /home/$USER/gowin
sudo tar -xvzf Gowin_Latest.tar.gz
sudo rm Gowin_Latest.tar.gz
ls -l
# is there a check to make sure we got the right files installed?
cd
sudo chown -R "$USER:$USER" /home/$USER/gowin
echo '  ____  _____  _  _  ____ '
echo ' (  _ \(  _  )( \( )( ___) '
echo '  )(_) ))(_)(  )  (  )__) '
echo ' (____/(_____)(_)\_)(____) '
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
echo '  _  _  ____  _  _  ____    ___  ____  ____  ____  ___ '
echo ' ( \( )( ___)( \/ )(_  _)  / __)(_  _)( ___)(  _ \/ __) '
echo '  )  (  )__)  )  (   )(    \__ \  )(   )__)  )___/\__ \ '
echo ' (_)\_)(____)(_/\_) (__)   (___/ (__) (____)(__)  (___/ '
echo "----------------------------------------------------"
echo " "
echo "----------------------------------------------------"
                                                      
