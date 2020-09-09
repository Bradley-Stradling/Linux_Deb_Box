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

cwd=$(pwd)

cd $HOME

if [ ! -f .bash_aliases ]; # need to check syntax here
then
echo "was not able to locate .bash_aliases in ${HOME} please check script. Exiting."
cd ${cwd}
exit 1
fi

read -p "What will this new alias do? (comment) -->" comment
read -p "What will call this alias? -->" alias_Call
read -p "what will this alias do? -->" alias_Do

echo " "
echo "# ${comment} will be written to .bash_aliases"
echo -e "alias ${alias_Call}='${alias_Do}'"
echo "The above will will be written to the end of .bash_aliases"
read -p "Does this look correct? y/n -->" check

if [ ${check} == 'y' ];
then
echo "" >> .bash_aliases
echo "# ${comment}" >> .bash_aliases
echo -e "alias ${alias_Call}='${alias_Do}'" >> .bash_aliases
echo " "
echo "# ${comment} appended to .bash_aliases"
echo -e "alias ${alias_Call}='${alias_Do}' appened to to .bash_aliases"
exec bash
cd ${cwd}
exit 1
else
echo "Whoops check the script or your inputs and try running again. Exiting."
cd ${cwd}
exit 1
fi
