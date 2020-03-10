#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/10/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to pack up my set-up. Copy scripts and aliases to repo and
# (*.*)   clean up the sourcing in them. Should only grab scripts and aliases.
#(")_(")  Should confirm each change to the repo before finalization.
#*******************************************************************************

# incomplete and untested as is !!!

# need to refactor to show what scripts have been changed.

# Script should sanitize files to read write only permissions.
# variable to scripts from source path is scripts_Path
# variable to repo from source path is repo_Path

read - p "Pack up and replace alises list in repo? y/n -->" pack_Aliases

if [ ${pack_Aliases} == 'y' ];
then
  echo "Copying .bash_aliases to ${repo_Path} and removing source."
  cp ${HOME}/.bash_aliases ${repo_Path}
#need to add code here to remove lines containing source from aliases file in local repo
  echo "Copied .bash_aliases to ${repo_Path} and removed source lines."
else
  echo "Leaving aliases file alone, new aliases not added to the repo."
fi

read -p "Do you want to add all scripts to local repo replacing any scripts that \
were changed? y/n -->" pack_Scripts

if [ ${pack_Scripts} == 'y'];
then
  for script in (ls ${scripts_Path}) # need to check this syntax
    do
        echo "Copying ${script} to ${repo_Path}/Scripts"
        cp ${script} ${repo_Path}/Scripts
# code to remove lines with source from each script in local repo here is needed.
        echo "${script} copied to ${repo_Path}/Scripts and source lines removed."
    done
else
  echo "Local scripts will not be copied to the local repo."
 fi
 
 if [ ${pack_Scripts} == 'y'];
 then
    for script in (ls ${repo_Path}/Scripts)
      do
          chmod 666 ${script}
          echo "Set permission in ${repo_Path}/Scripts for ${script} to read write only for all."
      done
fi
