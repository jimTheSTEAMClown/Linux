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
echo " Checking If The /home/$USER/gowin Directory Exists "
echo " If it exists, a backup will be made, and a new /home/$USER/gowin "
echo " will be created. Then the latest Gowin tools and software will be installed. "
echo "----------------------------------------------------"
echo " Enter y/Y or n/N or any Key?"
read -p "Check gowin Dir, create Backup & Copy Latest Gowin release in /home/$USER/gowin?: " yesBackUpInstallGowin
# elif statements
if [ "$yesBackUpInstallGowin" == "y" ] || [ "$yesBackUpInstallGowin" == "Y" ]; then
  echo "----------------------------------------------------"
    echo "getting home with cd "
    echo "----------------------------------------------------"
    echo " "
    cd
    pwd
    ls -l
    echo "----------------------------------------------------"
    if [ -d "/home/$USER/gowin" ];
        then
            echo "The Directory /home/$USER/gowin exists"
            echo "Creating a backup in /home/$USER/gowinBackUp"
            sudo mv /home/$USER/gowin /home/$USER/gowinBackUp 
    fi
    echo " The /home/$USER/gowin Directory Does Not Exist"
    echo " Create this gowin directory In /home/$USER/gowin"
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
