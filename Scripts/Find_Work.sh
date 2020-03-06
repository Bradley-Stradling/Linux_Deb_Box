#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Simple grep script to print to screen files in the current directory
# (*.*)   that are marked for further dvelopment by 
#(")_(")  "# !!!incomplete and needs more testing!!!"
#*******************************************************************************

# Note this script will always find it self may need make it an alias.

# alias findscriptwork='grep * "# !!!incomplete and needs more testing!!!"'

grep * "# !!!incomplete and needs more testing!!!"
