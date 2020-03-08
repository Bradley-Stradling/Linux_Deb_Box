#!/bin/bash

#*******************************************************************************

# !!!incomplete and needs more testing!!!

# name of new back up directory
INPUT$1

mkdir ${back_Up_Files_Path}/$1

cp -r * ${back_Up_Files_Path}/$1
