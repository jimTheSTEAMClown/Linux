#! /bin/bash
# UbuntuClassImageUpdate-Apps.sh
# These are for installing a bunch of Apps and Utilities  
echo "----------------------------------------------------"
echo "  [Script For Apps] - installing The Following Apps"
echo "    bash-completion"
echo "    HTOP - https://www.makeuseof.com/tag/5-powerful-alternatives-windows-task-manager/"
echo "    GIMP - https://tecadmin.net/install-gimp-on-ubuntu/"
echo "    Audacity - http://ubuntuhandbook.org/index.php/2018/09/audacity-2-3-0-released-install-ubuntu-18-10/"
echo "    GIT - https://linuxize.com/post/how-to-install-git-on-ubuntu-18-04/"
echo "    MAKE - https://www.vim.org/ and # https://phoenixnap.com/kb/how-to-install-vim-ubuntu"
echo "    VIM - https://www.vim.org/ and # https://phoenixnap.com/kb/how-to-install-vim-ubuntu"
echo "----------------------------------------------------"

echo "----------------------------------------------------"
echo "sudo apt update"
sudo apt update
echo "----------------------------------------------------"
echo "----------------------------------------------------"
echo "sudo apt install bash-completion"
sudo apt install bash-completion

# HTOP - Get a full overview of all the processes running on your system along with details like process IDs, CPU and RAM usage, and how long they’ve been running.
echo "sudo apt-get install htop"
sudo apt-get install htop

echo "----------------------------------------------------"
echo "sudo add-apt-repository ppa:otto-kesselgulasch/gimp"
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
echo "----------------------------------------------------"
echo "sudo apt-get update"
sudo apt-get update
echo "----------------------------------------------------"
echo "sudo apt-get install gimp"
sudo apt-get install gimp
echo "----------------------------------------------------"
echo "gimp -v"
gimp -v

echo "----------------------------------------------------"
echo "sudo apt update"
sudo apt update
echo "----------------------------------------------------"

echo "----------------------------------------------------"
echo "sudo add-apt-repository ppa:ubuntuhandbook1/audacity"
sudo add-apt-repository ppa:ubuntuhandbook1/audacity
echo "----------------------------------------------------"
echo "sudo apt update"
sudo apt update
echo "----------------------------------------------------"
echo "sudo apt-get install audacity"
sudo apt-get install audacity
echo "----------------------------------------------------"

# VIM - https://phoenixnap.com/kb/how-to-install-vim-ubuntu
echo "sudo apt-get install libncurses5-dev libncursesw5-dev"
sudo apt-get install libncurses5-dev libncursesw5-dev

echo "sudo apt install git"
sudo apt install git
echo "git --version"
git --version
# Now that you have git installed, it is a good idea to set up your 
# personal information that will be used when you commit your code.
# The following commands will set your git commit username and email address:
echo "Now that you have git installed, it is a good idea to set up your" 
echo "personal information that will be used when you commit your code."
echo "The following commands will set your git commit username and email address:"
echo "Do you wish to add your Name and Email to VIM?  Enter y/Y or n/N or any Key?"
read -p "update and upgrade?: " yesADD
# elif statements
if [ $yesADD == "y" ] || [ $yesADD == "Y" ]
then
echo "Let's get some data for VIM"
read -p "Enter Your Name?: " YourName
read -p "Enter Your Email?: " YourEmail
echo "git config --global user.name $YourName"
git config --global user.name $YourName
echo "git config --global user.email $YourEmail"
git config --global user.email $YourEmail
echo "----------------------------------------------------"
elif [ $yesADD == "n" ] || [ $yesADD == "N" ]
then
echo "Skipping this install"
else
echo "Skipping this install"
fi
echo "To verify the configuration changes, type:"
git config --list
echo "----------------------------------------------------"
echo "sudo apt install make"
sudo apt install make
sudo apt install build-essential
echo "----------------------------------------------------"
# VIM - https://phoenixnap.com/kb/how-to-install-vim-ubuntu
echo "sudo git clone https://github.com/vim/vim.git"
sudo git clone https://github.com/vim/vim.git
echo "----------------------------------------------------"
echo "cd vim/src"
cd vim/src
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
echo "vim -v"
vim -v
cd ..
cd ..



echo " "
echo "----------------------------------------------------"
echo "Done Installing Apps and Tools"
echo "----------------------------------------------------"

## Stuff to see about or do later
## https://www.cyberciti.biz/faq/add-bash-auto-completion-in-ubuntu-linux/
## source it from ~/.bashrc or ~/.bash_profile ##
# echo "source /etc/profile.d/bash_completion.sh" >> ~/.bashrc
# source /etc/profile.d/bash_completion.sh
## Another example Check and load it from ~/.bashrc or ~/.bash_profile ##
# grep -wq '^source /etc/profile.d/bash_completion.sh' ~/.bashrc || echo 'source /etc/profile.d/bash_completion.sh'>>~/.bashrc
