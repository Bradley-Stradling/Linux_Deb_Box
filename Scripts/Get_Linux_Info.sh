#!/bin/bash

#*******************************************************************************

# this needs to have the time cut I guess...
currenttime=${date}

echo $currenttime

echo -e "Uname info is: $(uname -a)\n"

echo -e "The ip addresses associated with this account are: $(hostname -i)\n"

echo -e "These are the users logged in :\n $(who)\n"

echo -e "The hostname for this account is: $(hostname)\n"

echo -e "The dns servers are: \n$(cat /etc/resolv.conf | awk NR\>1)"

echo -e "\n The memory info is as below."

free | head -n +2

echo -e "\n The cpu model is."

lscpu | grep "Model name" | cut -d " " -f 4-#!/bin/bash

#*******************************************************************************
