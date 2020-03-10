#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to pull some info about the current linux box.
# (*.*)   
#(")_(")  
#*******************************************************************************

# this needs to have the time cut possibly but I'm cool with verbose exact time

cwd=$(pwd)

get_Sys_Info() {
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
lscpu | grep "Model name"
}

echo "Ready to pull some system information."
read -p "Do you want to ouput to the 1. terminal, 2. a file in the current \
directory of ${cwd} or 3. both  -->" file_Write 

echo " "

if [ ${file_Write} == '1' ];
  then
    (get_Sys_Info)
    elif [ ${file_Write} == '2' ];
      then
      (get_Sys_Info) > Sys_Info_Output.txt
      elif [ ${file_Write} == '3' ];
        then
        (get_Sys_Info)
        (get_Sys_Info) > Sys_Info_Output.txt
          else
            echo "unavailable selection inputed exiting script."
            exit
fi








