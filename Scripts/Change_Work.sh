#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to change the sourced variable of the gowork
# (*.*)   alias to the input'd full path.
#(")_(")  
#*******************************************************************************

# script tested and debugged works as is :3

# needs to be adjusted so terminal doesnt have to be reloaded.


read -p "Enter the full path to the new work spot ==>" werkpath

if [ -d ${werkpath} ];
  then
    echo "work_Path=${werkpath}" > ${work_Path_File}
    echo "work_Path=${werkpath} written to ${work_Path_File}"
  else
    echo "Unable to locate ${werkpath}. ${work_Path_File} is unchanged."
    exit 1
fi

# reset bash shell env
exec bash
