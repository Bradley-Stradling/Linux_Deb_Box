#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to create and set a new mode to xrandr for a resolution not
# (*.*)   already in it's current scope. Specifically want to have 1920x1080
#(")_(")  added to resolution list. Script should be able to create any though.
#*******************************************************************************

# incomplete and untested as is

echo -p "Do you want to add 1920px1080p 60hz to xrandr? y/n-->" add_Rez

if [ $setup_Check != 'y' ];
then
echo "Alright then don't run the script >.> exiting..."
echo -e " (\_/)\n (v.v) Sad Rabbit...\n(\")_(\")"
exit 1
fi

echo -e "Executing \"xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync\""

xrandr --newmode "1920x1080_60.00"  172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync

echo -p "Please enter the name of the output in xrandr to add the new mode to. -->" mode_Name

echo -e "executing \"xrandr --addmode ${mode_Name} "1920x1080_60.00\""

