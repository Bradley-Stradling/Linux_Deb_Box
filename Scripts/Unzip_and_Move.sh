#!/bin/bash

#*******************************************************************************

# Script is broken until paths source is connected. then needs refactor.

# !!!incomplete and needs more testing!!!

cwd=${pwd}

zip_Back_Up=$(date)_zips

read -p "Enter the location of the .zips to unpack -->" zip_Files

cd $zip_Files

mkdir ${back_Up_Files_Path}/${zip_Back_Up}

cp -r * ${back_Up_Files_Path}/${zip_Back_Up}

unzip \*.zip; find . -name "*.zip" -type f -delete

cd $cwd
