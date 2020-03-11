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

# !!!incomplete and needs more testing!!!

# needs a lot of error checking and output confirmation to terminal of success

cwd=${pwd}

zip_Back_Up=$(date)_zips

read -p "Enter the location of the .zips to unpack -->" zip_Files

if [ !-d ${zip_Files} ];
then
  echo "Path to ${zip_Files} not found, exiting script."
  exit
fi

# this needs to be reworked to copy .zip files to back up as well as currrent directory
# then unpack them in current directory and delete the .zips from current directory
# to maintain redunancy against file loss as the .zips should exist in back up as
# well as still be in the target.

cd $zip_Files

mkdir ${back_Up_Files_Path}/${zip_Back_Up}

cp -r "*.zip" ${back_Up_Files_Path}/${zip_Back_Up}

unzip \*.zip; find . -name "*.zip" -type f -delete

cd $cwd
