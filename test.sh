#! /bin/bash
# ============================================================================
echo " "
echo "   ___  _   _  ____  ___  _  _     ___  _____  _    _  ____  _  _ "
echo "  / __)( )_( )( ___)/ __)( )/ )   / __)(  _  )( \/\/ )(_  _)( \( ) "
echo " ( (__  ) _ (  )__)( (__  )  (   ( (_-. )(_)(  )    (  _)(_  )  ( "
echo "  \___)(_) (_)(____)\___)(_)\_)   \___/(_____)(__/\__)(____)(_)\_) "
echo " Checking If The $USER/gowin Directory Exists "
echo "----------------------------------------------------"
echo " Do you wish to check if the gowin directory exists in $USER home?"
echo " If it does, do you want to back it up?"
echo " Enter y/Y or n/N or any Key?"
read -p "Check & Backup the $USER/gowin Directory In $USER Home?: " yesBackUpGowin
# elif statements
if [ "$yesBackUpGowin" == "y" ] || [ "$yesBackUpGowin" == "Y" ]; then
  echo "----------------------------------------------------"
    echo "getting home with cd "
    echo "----------------------------------------------------"
    echo " "
    cd
    pwd
    ls -l
    echo "----------------------------------------------------"
    if [ -d "$USER/gowin" ];
        then
            echo "The Directory $USER/gowin exists"
            echo "Creating a backup in $USER/gowinBackUp"
            sudo mv gowin gowinBackUp 
    fi
    # ============================================================================
    echo " "  
    echo '   ___  ____  ____    __   ____  ____    ____  ____  ____ '
    echo '  / __)(  _ \( ___)  /__\ (_  _)( ___)  (  _ \(_  _)(  _ \ '
    echo ' ( (__  )   / )__)  /(__)\  )(   )__)    )(_) )_)(_  )   / '
    echo '  \___)(_)\_)(____)(__)(__)(__) (____)  (____/(____)(_)\_) '
          
    echo " The $USER/gowin Directory Does Not Exist"
    echo " Create this gowin directory In $USER/gowin"
    sudo mkdir -p /home/$USER/gowin
    echo "----------------------------------------------------"
elif [ "$yesBackUpGowin" == "n" ] || [ "$yesBackUpGowin" == "N" ]
    then
    echo "Skipping This Check For gowin Directory Step"
    if [ -d "$USER/gowin" ];
        then
            echo "The Directory $USER/gowin exists"
            echo "Exiting this shell scripts"
            exit 1
            # return
    fi
else
    echo "Any Key - Skipping This Check For gowin Directory Step"
    exit 1
    # return
fi
