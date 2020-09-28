  
#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 9/28/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to clear out deployment and restore .bash aliases and .bashrc
# (*.*)   from back up folder.
#(")_(")  
#*******************************************************************************

read -p "Would you like to clear out previous deployment of Linux_Deb_Box? y/n -->" clr_Deploy

if [ ${clr_Deploy} == y ]; then
  echo "clearing previous deployment of Linux_Deb_Box and restore .bash_alises from"
  # clear out
  else
    echo "Then don't run this dangerous script that might remove things u don't want to o.0 exiting.."
    exit 1
fi
