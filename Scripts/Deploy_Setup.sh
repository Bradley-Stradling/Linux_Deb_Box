#!/bin/bash

# incomplete and untested as is!!!

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to be run after pulling the repo to a new box
# (*.*)   or account. Should be run from home directory? Could be used for a
#(")_(")  root account? Needs testing. Wherever the target .bashrc is.
#*******************************************************************************

# Needs error checking to ensure paths and directories were generated correctly?

# Grab current working directory and store in variable cwd
cwd=$(pwd)

# Need to add prompt to ask for dependancies before script run y/n

read -p "Please enter the full path the the Linux_Deb_Box repo -->" Repo_Path

source_Dir=Sources
test_Dir=Test_Boxs
scripts_Dir=My_Scripts
back_Up_Dir=Back_Up_Files

bashrc_Dir=Set-up

pathz_File=Paths.txt
workz_File=Workpath.txt

path_Source_Dir=${cwd}/${source_Dir}
path_Test_Dir=${cwd}/${test_Dir}
path_Scripts_Dir=${cwd}/${scripts_Dir}
path_Back_Up_Dir=${cwd}/${back_Up_Dir}


# make new directories
mkdir ${path_Sources_Dir}
mkdir ${path_Test_Dir}
mkdir ${path_Scripts_Dir}
mkdir ${path_Back_Up_Dir}
mkdir ${path_Back_Up_Dir}/${bashrc_Dir}

# If error check here for directories

for directory in $(ls ${cwd});
do
chmod 700 ${path_Scripts_Dir}/$directory
done

touch ${path_Sources_Dir}/${pathz_File}
touch ${path_Sources_Dir}/${workz_File}

# If error check here for created files

# write variable for paths to path source file
echo "source_Path=${path_Sources_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path=${path_Test_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "scripts_Path=${path_Scripts_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "back_Up_Files_Path=${path_Back_Up_Dir}" >> ${path_Sources_Dir}/${pathz_File}
# target for change work to change work target with go work alias
echo "work_Path_File=${path_Sources_Dir}/${workz_File}" >> ${path_Sources_Dir}/${pathz_File}

# back up the .bashrc
cp .bashrc ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak

# add scripts directory to my path.
echo "# Added path to my scripts directorys." >> .bashrc
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\"" >> .bashrc
echo "source ${path_Sources_Dir}/${pathz_File}" >> .bashrc

# add aliases file
cp ${Repo_Path}/aliases .bash_aliases

# prepend source of path file to aliases file
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
# prepend
echo "source ${path_Sources_Dir}/${workz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases

# add cp of scripts to Scripts folder from repo
cp ${Repo_Path}/Scripts/* ${path_Scripts_Dir}

# attempting to prepend source file to all scripts 
for script in $(ls ${path_Scripts_Dir});
do
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - ${path_Scripts_Dir}/$script > \
${path_Scripts_Dir}/temp && mv ${path_Scripts_Dir}/temp ${path_Scripts_Dir}/$script
done

for script in $(ls ${path_Scripts_Dir});
do
chmod 700 ${path_Scripts_Dir}/$script
done

# need to add removal of common unwanted directories
