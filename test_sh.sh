
#! /bin/bash
echo "Running $ update with -y"
sudo apt-get update -y
echo "Running $ upgrade with -y"
sudo apt-get upgrade -y
echo "Running install of $ Scrot"
sudo apt-get install -y scrot
echo "Done"
