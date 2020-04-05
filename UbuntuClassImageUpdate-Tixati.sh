#! /bin/bash
# UbuntuClassImageUpdate-Tixati.sh
# Tixati is a torrent program  
# https://www.tixati.com/download/linux.html
# http://elinuxbook.com/install-tixati-torrent-client-in-ubuntu-16-04-a-best-torrent-software-for-linux/
echo "----------------------------------------------------"
echo "installing tixati"
echo "----------------------------------------------------"
echo " "
Echo "sudo wget -O tixati_2.72-1_amd64.deb https://download2.tixati.com/download/tixati_2.72-1_amd64.deb"
sudo wget -O tixati_2.72-1_amd64.deb https://download2.tixati.com/download/tixati_2.72-1_amd64.deb
echo "sudo dpkg -i tixati_2.72-1_amd64.deb"
sudo dpkg -i tixati_2.72-1_amd64.deb
echo "sudo dpkg -l tixati"
sudo dpkg -l tixati
echo " "
echo "----------------------------------------------------"
echo "Done Installing tixati"
echo "----------------------------------------------------"
