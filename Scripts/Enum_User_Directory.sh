#!/bin/bash

# incomplete and untested as is!!!

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/9/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script will be intended to run and list all available directories
# (*.*)   and write them to a file. Later to be used to source path variables
#(")_(")  for other scripts on a new box.
#*******************************************************************************

# Plan to write script to enumerate out to a file a listing of directory paths
# available in the cwd and below in the tree. want to set a flag for which
# version/flags will be used for ls. as in ls -l ls -a etc.
# need to find a way to flag or loop enum directory depth to go as deep as
# needed without looping into non existent depths.

# just a bit if test script to see if this method can work at all

# don't think this is needed yet but set it anyway.
cwd=$(pwd)

touch enum_Dir_List

# will this even work unsure and untested.
echo "1 directory deep paths" >> enum_Dir_List
ls >> enum_Dir_List
echo "2 directory deep paths" >> enum_Dir_List
ls /* >> enum_Dir_List
echo "3 directory deep paths" >> enum_Dir_List
ls /*/* >> enum_Dir_List
