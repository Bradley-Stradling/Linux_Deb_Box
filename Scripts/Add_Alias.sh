#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/10/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to append new alias with comment to .bash_aliases.
# (*.*)   Should be able to run this on the fly from any directory append
#(")_(")  the inputs to the aliases file and return to wherever you were.
#*******************************************************************************

# !!!incomplete and needs more testing!!!

cwd=$(pwd)

# move to home directory (may want to just add path to home to file output)
# or source path to home directory through variable
cd $HOME

# check if .bash_aliases was located properly.
if [ !-f .bash_aliases ]; # need to check syntax here
then
echo "was not able to locate .bash_aliases in ${HOME} please check script. Exiting."
#return to working directory
cd ${cwd}
exit 1
fi

# need to check that spaces in input and full string is passed to comment variable
read -p "What will this new alias do? -->" comment
read -p "What will call this alias? -->" alias_Call
read -p "what will this alias do? -->" alias_Do

echo " "
echo "# ${comment} will be written to .bash_aliases"
echo -e "alias ${alias_Call}=\'${alias_Do}\' will be written to .bash_aliases"
echo "Does this look correct? y/m -->" check

if [ ${check} == 'y'];
then
echo "" >> .bash_aliases
echo "# ${comment}" >> .bash_aliases
echo -e "alias ${alias_Call}=\'${alias_Do}\'" >> .bash_aliases
echo " "
echo "# ${comment} appended to .bash_aliases"
echo -e "alias ${alias_Call}=\'${alias_Do}\' appened to to .bash_aliases"
#reset bash enviroment to pick up change
exec bash
#return to working directory
cd ${cwd}
exit 1
else
echo "Whoops check the script or your inputs and try running again. Exiting."
#return to working directory
cd ${cwd}
exit 1

