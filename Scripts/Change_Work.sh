#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to change the sourced variable of the gowork
# (*.*)   aliases to the input'd full path.
#(")_(")  
#*******************************************************************************

read -p "Which workpath would you like to change? 1 2 or 3 -->" which_Werk

case $which_Werk in

  1)
    read -p "Enter the full path to the new work spot 1 ==>" werkpath
    
    if [ -d ${werkpath} ];
      then
       echo "work_Path_1=${werkpath}" > ${work_Path_1}
       echo "work_Path_1=${werkpath} written to ${work_Path_1}"
    else
      echo "Unable to locate ${werkpath}. ${work_Path_1} is unchanged."
    exit 1
  fi

  ;;
  2)
    read -p "Enter the full path to the new work spot 2 ==>" werkpath
    
    if [ -d ${werkpath} ];
      then
       echo "work_Path_1=${werkpath}" > ${work_Path_2}
       echo "work_Path_1=${werkpath} written to ${work_Path_2}"
     else
      echo "Unable to locate ${werkpath}. ${work_Path_2} is unchanged."
     exit 1
    fi
  ;;
  3)
     read -p "Enter the full path to the new work spot 3 ==>" werkpath
    
    if [ -d ${werkpath} ];
      then
       echo "work_Path_1=${werkpath}" > ${work_Path_3}
       echo "work_Path_1=${werkpath} written to ${work_Path_3}"
     else
      echo "Unable to locate ${werkpath}. ${work_Path_3} is unchanged."
     exit 1
    fi
  ;;
  *)
    echo "Not sure what your trying to do there bub sorry exiting..."
    exit 1
  ;;

exec bash
