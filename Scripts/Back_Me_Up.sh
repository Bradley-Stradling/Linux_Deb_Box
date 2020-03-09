#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is meant to be called to back up the entire contents of
# (*.*)   the current directory to a new directory with the passed name within
#(")_(")  the back up directory.
#*******************************************************************************

# incomplete and untested as is !!!

# need to add error checking and maybe change arugment pass to a prompt

# name of new back up directory
INPUT$1

cwd=$(pwd)

# not sure if this will do what I want but want to try it
# if input string is empty error message and exit script
if [ -z $1 ];
then
  echo "Please run the script again with a name for the backup directory passed."
  exit
fi

new_Back_Up_Dir=${back_Up_Files_Path}/$1

mkdir ${new_Back_Up_Dir}

if [ -d ${new_Back_Up_Dir} ];
  then
    cp -r * ${new_Back_Up_Dir}
    echo "contents of ${cwd} copied to ${new_Back_Up_Dir} successfully."
  else
    echo "Unable to create path to ${new_Back_Up_Dir}. Copy failed."
    exit
fi
