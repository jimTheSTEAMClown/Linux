#! /bin/bash
# VLC - this is a  Video and Music Media Player app.  
# See: https://www.vlchelp.com/install-ubuntu-linux/ for some install tips.
# You can take a look at https://www.vlchelp.com/vlc-media-player/ about it.
echo "----------------------------------------------------"
echo "installing VLC"
echo "----------------------------------------------------"
echo " "
echo "Installing VLC" 
sudo apt-get install vlc -y
sudo apt-get update -y
sudo apt-get upgrade -y
sudo vlc -V
echo " "
echo "----------------------------------------------------"
echo "Done Installing VLC"
echo "----------------------------------------------------"
