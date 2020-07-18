#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 7/17/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to quickly convert a pcapng to a pcap format.
# (*.*)   
#(")_(")  
#*******************************************************************************

INPUT=$1

file ${1}

editcap -F libpcap ${1} converted_${1}

file converted_${1}
