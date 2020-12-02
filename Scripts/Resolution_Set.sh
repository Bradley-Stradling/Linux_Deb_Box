#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of recent revision: 7/4/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to create and set a new mode to xrandr for a resolution not
# (*.*)   already in it's current scope. Specifically want to have 1920x1080
#(")_(")  added to resolution list. 
#*******************************************************************************

read -p "Do you want to add 1920px1080p 60hz to xrandr? y/n-->" setup_Check

if [ $setup_Check != 'y' ];
then
echo "Alright then don't run the script >.> exiting..."
echo -e " (\_/)\n (v.v) Sad Rabbit...\n(\")_(\")"
exit 1
fi

#remove this if broke
output_name={$1}

echo -e "Executing \"xrandr --newmode "1920x1080"  172.80 1920 2040 2248 2576 1080 1081 1084 1118  -HSync +Vsync\""

xrandr --newmode 1920x1080 172.80  1920 2040 2248 2576  1080 1081 1084 1118  -HSync +Vsync

#uncomment out this if broke
#read -p "Please enter the name of the output in xrandr to add the new mode to. -->" output_Name

echo -e "Executing \"xrandr --addmode ${output_Name} \"1920x1080\"\""

xrandr --addmode ${output_Name} "1920x1080"

echo -e "You may now use \"xrandr --output ${output_Name} --mode 1920x1080\" to set the display to 1920x1080"

echo "Try out the Add_Alias script to get this added as an alias for ezpz"
