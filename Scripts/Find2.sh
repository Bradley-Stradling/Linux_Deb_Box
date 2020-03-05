#!/bin/bash

#*******************************************************************************

#find file script

INPUT1=$1 #file  string name 1
INPUT2=$2 #file string name 2

find -type f -iname *$1* -o -type f -iname *$2*


