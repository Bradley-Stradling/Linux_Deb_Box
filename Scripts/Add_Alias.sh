#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/10/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to append new alias with comment to .bash_aliases.
# (*.*)   
#(")_(")  
#*******************************************************************************

cwd=$(pwd)

# move to home directory (may want to just add path to home to file output)
# or source path to home directory through variable
cd $HOME

read -p "What will this new alias do? -->" comment
read -p "What will call this alias? -->" alias_Call
read -p "what will this alias do? -->" alias_Do

echo "# ${comment}" >> .bash_aliases
echo -e "alias ${alias_Call}=\'${alias_Do}\'" >> .bash_aliases

#return to working directory
cd ${cwd}

#reset bash enviroment to pick up change
exec bash
