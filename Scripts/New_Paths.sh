#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to be run after pulling the repo to a new box
# (*.*)   or account. Should be run from home directory? Could be used for a 
#(")_(")  root account? Needs testing. Wherever the target .bashrc is.
#*******************************************************************************

# !!!incomplete and needs more testing!!!

# Needs error checking to ensure paths and directories were generated correctly?

cwd=$(pwd)

# Need to add prompt to ask for dependancies before script run y/n

read -p "Please enter the full path the the Linux_Deb_Box repo." Repo_Path

source_Dir=Sources
test_Dir=Test_Boxs
scripts_Dir=My_Scripts
back_Up_Dir=Back_Up_Files
bashrc_Dir=Set-up
pathz_File=Paths.txt
workz_File=Workpath.txt

# make new directories
mkdir ${cwd}/${source_Dir}
mkdir ${cwd}/${test_Dir}
mkdir ${cwd}/${scripts_Dir}
mkdir ${cwd}/${back_Up_Dir}
mkdir ${cwd}/${back_Up_Dir}/${bashrc_Dir}

# If error check here for directories

touch ${cwd}/${source_Dir}/${pathz_File}

# Change work script needs to be targeted to the file
touch ${cwd}/${source_Dir}/${workz_File}

# write variable for paths to path source file
echo "source_Path=${cwd}/${source_Dir}" >> ${cwd}/${source_Dir}/${pathz_File}
echo "test_Path=${cwd}/${test_Dir}" >> ${cwd}/${source_Dir}/${pathz_File}
echo "scripts_Path=${cwd}/${scripts_Dir}" >> ${cwd}/${source_Dir}/${pathz_File}
echo "back_Up_Files_Path=${cwd}/${back_Up_Dir}" >> ${cwd}/${source_Dir}/${pathz_File}
echo "work_Path_File=${cwd}/${source_Dir}/${workz_File} >> ${cwd}/${source_Dir}/${pathz_File}

# back up the .bashrc
cp .bashrc ${cwd}/${back_Up_Dir}/${bashrc_Dir}/bashrc.bak

# add scripts directory to my path.
echo "# Added path to my scripts directorys." >> .bashrc
echo "export PATH=\"${cwd}/${scripts_Dir}:\$PATH\"" >> .bashrc
echo "source ${cwd}/${source_Dir}/${pathz_File}" >> .bashrc

# add aliases file
cp ${Repo_Path}/aliases .bash_aliases

# prepend source of path file to aliases file
echo "source ${cwd}/${source_Dir}/${pathz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases


# add cp of scripts to Scripts folder from repo
cp ${Repo_Path}/Scripts/* ${cwd}/${scripts_Dir}

# need to add removal of common unwanted directories
