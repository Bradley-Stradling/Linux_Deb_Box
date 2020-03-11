#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to shorthand locate and find a single file verbosely from the 
# (*.*)   home directory without having to leave the current working directory.
#(")_(")  
#*******************************************************************************

# incomplete and broken as is !!!

# want to grab user input move to home directory locate the full path to the file
# and return to the current working directory after outputing the files full 
# location and name Possibly list all files with duplicate names
# and their respective location? More work to be done.

read -p "Please enter the name of the file you want to find." file_Name

# this might not be the way to do this but want to redirect output to variable
locate ${file_Name}

find -type f -iname *$1*


