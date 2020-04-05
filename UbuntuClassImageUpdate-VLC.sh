#! /bin/bash
# VLC - this is a  Video and Music Media Player app.  
# See: https://www.vlchelp.com/install-ubuntu-linux/ for some install tips.
# You can take a look at https://www.vlchelp.com/vlc-media-player/ about it.
echo "----------------------------------------------------"
echo "  [script VLC] Installing VLC"
echo "----------------------------------------------------"
echo " "
sudo apt-get install vlc -y
sudo apt-get update -y
sudo apt-get upgrade -y
vlc -V
echo " "
echo "----------------------------------------------------"
echo "  [script VLC] Done Installing VLC"
echo "----------------------------------------------------"
