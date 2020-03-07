#!/bin/bash

#*******************************************************************************

# Script is broken until paths source is connected. then needs refactor.

# !!!incomplete and needs more testing!!!

read -p "Enter the location of the .zips to unpack."

mkdir //home/bread/Back-ups/$1

cp -r * //home/bread/Back-ups/$1

unzip \*.zip; find . -name "*.zip" -type f -delete

cp -r * /$2
