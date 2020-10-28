#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 10/28/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script with options to pass in cidr notation for IPV4 addresses, or
# (*.*)   a list of cidr notations, or a file with a list of ip addresses and 
#(")_(")  cidr notations to be expanded.
#*******************************************************************************

red=`tput setaf 1`
green=`tput setaf 2`
yellow='tput setaf 3'
reset=`tput sgr0`

# need to hammer out the possibilities and scope of the script
# should this be it's own toolset with multiple scripts?
: 'example script call 
./Cidr_Expander.sh --single "192.168.1.0/24" --output -standard
./Cidr_Expander.sh --list ${list} --output -list "name_Of_New_List"
./Cidr_Expander.sh --file pathto/file_Name --output -file "name_Of_New_File"
'
