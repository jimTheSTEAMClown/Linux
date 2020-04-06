#! /bin/bash
# UbuntuClassImageUpdate-VIM.sh
# Installing VIM  
echo "----------------------------------------------------"
echo "installing VIM"
echo "----------------------------------------------------"
echo " "
echo "There is a DEPENDENCY on having Git and Make installed. Have they been installed?  Enter y/Y or n/N or any Key?"
which git
git --version
which make
make -v
echo "----------------------------------------------------"
echo " "
read -p "update and upgrade?: " yesADD
# elif statements
if [ $yesADD == "y" ] || [ $yesADD == "Y" ]
then
echo "----------------------------------------------------"
# VIM - https://phoenixnap.com/kb/how-to-install-vim-ubuntu
echo "sudo git clone https://github.com/vim/vim.git"
sudo git clone https://github.com/vim/vim.git
echo "----------------------------------------------------"
echo "cd vim/src"
cd vim/src
pwd
ls -l
echo "----------------------------------------------------"
echo "sudo make"
sudo make
echo "----------------------------------------------------"
echo "sudo make install"
sudo make install
echo "----------------------------------------------------"
echo "which vim"
which vim
echo "----------------------------------------------------"
echo "vim --version"
vim --version
cd ..
cd ..
echo "----------------------------------------------------"
elif [ $yesADD == "n" ] || [ $yesADD == "N" ]
then
echo "Skipping adding Name and Email"
else
echo "Skipping adding Name and Email"
fi

echo " "
echo "----------------------------------------------------"
echo "Done Installing VIM"
echo "----------------------------------------------------"
