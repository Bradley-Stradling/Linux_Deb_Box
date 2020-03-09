#!/bin/bash

#*******************************************************************************


# incomplete and untested as is!!!

echo "This script is designed to run from root on a linux box with standard \
    locations for etc/shadow, etc/gshadow, etc/group and etc/passwd. " ;
# need to add contional to check if user is in root if not exit script

chmod 600 /etc/shadow
chmod 600 /etc/gshadow
chmod 644 /etc/group
chmod 644 /etc/passwd

echo -e "Permissions should be changed! see below \n"

ls -la /etc/shadow /etc/gshadow /etc/group /etc/passwd



