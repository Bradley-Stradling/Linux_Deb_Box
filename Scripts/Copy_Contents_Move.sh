#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to copy the contents of the current working
# (*.*)   directory and move it to the passed target directory.
#(")_(")  
#*******************************************************************************

cwd=$(pwd)

read -p "Please enter the full path to copy the contents of the current working \
directory of ${cwd} to. -->" target_Dir 

if [ -d ${target_Dir} ];
  then
    cp -r * ${target_Dir}
    echo "Contents of ${cwd} copied to ${target_Dir}"
  else
    echo "Unable to path to ${target_Dir} copy failed."
    exit 1
fi
