#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/9/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to run updates with one input.
# (*.*)   
#(")_(")  
#*******************************************************************************

# incomplete and untested as is!!!

if (( $EUID != 0 )); then
    sudo ${scripts_Path}/Update.sh
    exit
fi

apt-get update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get clean
apt-get -y autoremove
