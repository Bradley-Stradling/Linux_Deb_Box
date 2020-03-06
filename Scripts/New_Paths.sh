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

# !!!incomplete and entirely untested!!!

# Needs error checking to ensure paths and directories were generated correctly

cwd=$(pwd)

# Need to add prompt to ask for dependancies before script run y/n

read -p "Please enter the full path the the Linux_Deb_Box repo." Repo_Path

# make new directories
mkdir ${cwd}/Sources
mkdir ${cwd}/Test_Boxs
mkdir ${cwd}/My_Scripts
mkdir ${cwd}/Back_Ups
mkdir ${cwd}/Back_Ups/Set-up

# If error check here for directories

# setting permissions
chmod 600 ${cwd}/Sources
chmod 600 ${cwd}/Test_Boxs
chmod 700 ${cwd}/My_Scripts
chmod 600 ${cwd}/Back_Ups

touch ${cwd}/Sources/My_Paths.txt

echo "Home_Path=${cwd}/Sources" >> ${cwd}/Sources/My_Paths.txt
echo "Test_Path=${cwd}/Test_Boxs" >> ${cwd}/Sources/My_Paths.txt
echo "Scripts_Path=${cwd}/My_Scripts" >> ${cwd}/Sources/My_Paths.txt
echo "Back_Up_Path=${cwd}/Back_Ups" >> ${cwd}/Sources/My_Paths.txt

# back up the .bashrc
cp .bashrc ${cwd}/Back_Ups/Set-up/.bashrc.bak

# add scripts directory to my path.
echo "# Added path to my scripts directorys." >> .bashrc
echo -e "export PATH=\"${cwd}/My_Scripts:$PATH\"" >> .bashrc

# add aliases file (will need manual connection from bash rc for now.)




# Need to add cp of aliases to .bash_aliases

# Need to add cp of scripts to Scripts folder from repo

# need to add removal of common unwanted directories

