#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to expedite the process of starting a new script. Will make
# (*.*)   the new script file write my rabbits comment header to the file
#(")_(")  and set permissions on the file.
#*******************************************************************************

INPUT1=$1 # name for new script

read -p "Create new script with filename of ${1}.sh? y/n -->" create

if [ ${create} == 'y' ];
  then
    touch ${scripts_Path}/$1.sh
    echo "${1}.sh has been created within ${scripts_Path}."
  else
    echo "Whoops nevermind exiting script..."
    exit 1
fi

echo "#!/bin/bash" > ${scripts_Path}/$1.sh

echo "" >> ${scripts_Path}/$1.sh

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh

echo -e "#  (\_/)\tAuthor: Bradley Stradling\n#  (o.o)\tDate of first revision: $(date)\n# (\")_(\")\tLincense: https://unlicense.org/" >> ${scripts_Path}/$1.sh

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh

echo -e "# (\_/)\t\n# (*.*)\t\n#(\")_(\")\t"

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh

echo "Standard comment header written to ${1}.sh"

read -p "Set script to user only read, write, and execute? y/n -->" perm_Set

if [ ${perm_Set} == 'y' ];
  then
    chmod 700 ${scripts_Path}/$1.sh
    echo "${1}.sh has been set to only user read write execute."
  else
  echo "You will have to change the permissions on ${1}.sh later on your own to run it..."
  exit 1
fi
    
