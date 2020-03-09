#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is meant to be called to back up the entire contents of
# (*.*)   the current directory to a new directory with the passed name within
#(")_(")  the back up directory.
#*******************************************************************************

# incomplete and untested as is !!!

# need to add error checking and maybe change arugment pass to a prompt

# name of new back up directory
INPUT$1

mkdir ${back_Up_Files_Path}/$1

cp -r * ${back_Up_Files_Path}/$1
