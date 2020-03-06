#!/bin/bash

#*******************************************************************************

INPUT1=$1
INPUT2=$2

# greps a directory for something then writes it to a file
grep $1 * > $2

