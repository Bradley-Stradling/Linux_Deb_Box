#!/bin/bash

#*******************************************************************************

INPUT1=$1 #name for zip file back up
INPUT2=$2 #path to move unzipped files to

mkdir //home/bread/Back-ups/$1

cp -r * //home/bread/Back-ups/$1

unzip \*.zip; find . -name "*.zip" -type f -delete

cp -r * /$2
