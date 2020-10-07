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
# flag list, install, update or remove, else exit
# directory handling/checking
# tool lists(lists) import
# pick list
# check the things
# confirm do the things?
# do the things
# check the things
# fin

###
echo "!!!NOTE! in planning/idea phase on implementation framework, this is untested!!!!"
read -p " Are you sure you meant to run this script before it's been tested?? y/n -->" run_Script

if [[ ${run_Script} != y ]]; then
  echo -e "Then please be careful running scripts that are unfinished \:P exiting.."
  exit 1
fi
###

tool_Path_Add()= {
# add tools directory to my path
echo "# Added path to my tools directorys. written to .bashrc"
echo "export PATH=\"${path_Tools_Dir}:\$PATH\" written to .bashrc"
echo "# Added path to my tools directorys." >> .bashrc
echo "export PATH=\"{path_Tools_Dir}:\$PATH\"" >> .bashrc
}

menu_Choice=0
flag=0
flag_Option=('filler' 'List' 'Install' 'Update' 'Remove')
note=0
main_Menu() {
if [[ ${note} == 0 ]]; then
  echo "Note: these are community tools and are not mine unless directly stated."
  echo "Tool accredidations and sources can be found within Tool_Accredidation in the Repo"
  $note=1 # theres likely a few ways to do this want to try this for now
fi
echo "Welcome to Deploy_Tools.sh what would you like to do?"
# flag list, install, update or remove, else exit
echo -e "\(0\) To exit the script"
echo -e "\(1\) To list a set of tools."
echo -e "\(2\) To install a set of tools"
echo -e "\(3\) To update a set of tools"
echo -e "\(4\) To remove a set of tools"
}

tool_List_Menu() {
echo -e "\(0\) To exit the script"
echo -e "\(1\) flag_Option[${flag}] ALL THE TOOLS"
echo -e "\(2\) flag_Option[${flag}] CTF tools"
echo -e "\(3\) flag_Option[${flag}] Penetration testing tools"
echo -e "\(4\) flag_Option[${flag}] Bug bounty tools"
echo -e "\(5\) flag_Option[${flag}] OSINT tools"
echo -e "\(6\) flag_Option[${flag}] Editing tools \(code/text\)" # need to check if / needs to be escaped
}

getouttahere() {
echo -e "Exiting script!"
exit 0
}
flag=0
get_Main_Menu_Choice() {
read -p "Which set of tools would you like to deploy? --> " menu_Choice

case ${menu_Choice} in
  1)
    echo " Your choice was ${menu_Choice}"
    flag=${menu_Choice}
  ;;
  2)
    echo " Your choice was ${menu_Choice}"
    flag=${menu_Choice}
  ;;
  3)
    echo " Your choice was ${menu_Choice}"
    flag=${menu_Choice}
  ;;
  4)
    echo " Your choice was ${menu_Choice}"
    flag=${menu_Choice}
  ;;
  *)
    echo " Your choice was not indicated in the menu options, what're you doing o.O"
    getouttahere
  ;;
esac
}

get_Tool_List_Choice() {
read -p "Which set of tools would you like to deploy? --> " menu_Choice

case ${menu_Choice} in
  1)
    echo " Your choice was 'flag_Option[${flag}]' ${tool_Set_Choice}"
  ;;
  2)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  3)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  4)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  5)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  6)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  7)
    echo " Your choice was 'flag_Option[${flag}]' ${menu_Choice}"
  ;;
  *)
    echo " Your choice was not indicated in the menu options, what're you doing o.O"
    getouttahere
  ;;
esac
}

while [[ ${menu_Choice} != 0 ]]; do

main_Menu

get_Main_Menu_Choice

tool_List_Menu

get_Tool_List_Choice

# do_The_Things

done

getouttahere
