#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to unpack .zip files at target location and return to 
# (*.*)   current working directory, as well as back up .zip files and then
#(")_(")  remove .zip files from target location.
#*******************************************************************************

# Script is broken until paths source is connected. then needs refactor.

# !!!incomplete and needs more testing!!!

# needs a lot of error checking and output confirmation to terminal of success

cwd=${pwd}

zip_Back_Up=$(date)_zips

read -p "Enter the location of the .zips to unpack -->" zip_Files

cd $zip_Files

mkdir ${back_Up_Files_Path}/${zip_Back_Up}

cp -r "*.zip" ${back_Up_Files_Path}/${zip_Back_Up}

unzip \*.zip; find . -name "*.zip" -type f -delete

cd $cwd
