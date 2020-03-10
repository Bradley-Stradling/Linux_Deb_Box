#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to set some /etc files to root only access and read only for 
# (*.*)   others.
#(")_(")  
#*******************************************************************************

# incomplete and untested as is!!!

echo "This script is designed to run from root on a linux box with standard \
    locations for etc/shadow, etc/gshadow, etc/group and etc/passwd. " ;
# need to add contional to check if user is in root if not exit script

read -p "Are u running this as root? y/n -->" runasroot

# this is not dummy proof but will work for now, should be more verbose check on
# what the user calling this script is logged in as.
if [ ${runasroot} -ne y];
then
echo "Script must be run as root. Exiting."
exit
fi

chmod 600 /etc/shadow
chmod 600 /etc/gshadow
chmod 644 /etc/group
chmod 644 /etc/passwd

echo -e "Permissions should be changed! see below \n"

ls -la /etc/shadow /etc/gshadow /etc/group /etc/passwd



