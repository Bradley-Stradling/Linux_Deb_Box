#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 10/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Starting a script for deploying tools to My_Tools.
# (*.*)   NOTE! in planning/idea phase on implementation framework
#(")_(")  
#*******************************************************************************

# when toolset, or toolsets are deployed, a listing of tools should be added in 
# a file in in Sources directory (likely file generated and path added in Deploy_Setup.sh)
# determining if some tools should overlap or not will come after tool lists have been
# determined, if they do overlap script should already be detecting if tool is installed

# define options functions
# flag list install or update else exit
# pick list
#
#
#
#
#
#
#





###
echo "!!!NOTE! in planning/idea phase on implementation framework, this is untested!!!!"
read -p " Are you sure you meant to run this script before it's been tested?? y/n -->" run_Script

if [[ ${run_Script} != y ]]; then
  echo -e "Then please be careful running scripts that are unfinished \:P exiting.."
  exit 1
fi
###

echo "Note: these are community tools and are not mine unless directly stated."
echo "Tool accredidations and sources can be found within Tool_Accredidation in the Repo"

# Tools should be checked for dependancies and prereq's and prompt user for input.

# Convert below outputs to a function, so it may be called more than once in a loop

echo -e "\(1\) ALL THE TOOLS"
echo -e "\(2\) CTF tools"
echo -e "\(3\) Penetration testing tools"
echo -e "\(4\) Bug bounty tools"
echo -e "\(5\) OSINT tools"
echo -e "\(6\) Editing tools \(code/text\)" # need to check if / needs to be escaped

read -p "Which set of tools would you like to deploy? --> " tool_Set_Choice

case ${tool_Set_Choice} in

  1)

  ;;
  2)

  ;;
  3)

  ;;
  4)

  ;;
  5)

  ;;
  6)

  ;;
  7)

  ;;
