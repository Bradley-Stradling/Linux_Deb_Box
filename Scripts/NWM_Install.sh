#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 7/17/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to install and uninstall network miner to a debian or arch
# (*.*)   based operating system. Including all dependancies for mono.
#(")_(")  
#*******************************************************************************

##commands and the entirity the inspiration for this coutesy of 
## https://www.netresec.com/?page=Blog&month=2014-02&post=HowTo-install-NetworkMiner-in-Ubuntu-Fedora-and-Arch-Linux

#### Must be run from root ####

echo -e "!!!! NOTE\: This script is untested and may install dependancies you are not in want of..!!!!"
read -p " Are you sure you meant to run this script before it's been tested?? y/n -->" run_Script

if [[ ${run_Script} != y ]]; then
  echo -e "Then please be careful running scripts that are unfinished \:P exiting.."
  exit 1
fi

if [ euid != 0 ] # syntax for euid variable is nowhere close to correct!!!
echo "you must run this script as root or with root permissions sorry"
exit 1
fi

cwd=$(pwd)

read -p "Would you like to install or remove networkminer and all of its dependancies? i/r" install_Remove

case $install_Remove in
1)
  ## Installing dependancies
  apt-get install libmono-system-windows-forms4.0-cil
  apt-get install libmono-system-web4.0-cil
  apt-get install libmono-system-net4.0-cil
  apt-get install libmono-system-runtime-serialization4.0-cil
  apt-get install libmono-system-xml-linq4.0-cil

  ## Fetching and unzipping networkminer files
  wget https://www.netresec.com/?download=NetworkMiner -O /tmp/nm.zip
  sudo unzip /tmp/nm.zip -d /opt/
  cd /opt/NetworkMiner*
  sudo chmod +x NetworkMiner.exe
  sudo chmod -R go+w AssembledFiles/
  sudo chmod -R go+w Captures/
  nvm_path=$(pwd)

  ## Building networkminer for the first time
  mono NetworkMiner.exe --noupdatecheck

  ## add new bash alias to open networkminer from the console
  # move to home directory (may want to just add path to home to file output)
  # or source path to home directory through variable
  cd $HOME ## this needs to set to either users directory, or who am i kinding networkminer needs root.. ?

  # check if .bash_aliases was located properly.
  if [ -f .bash_aliases ]; # need to check syntax here
  then
  echo "alias networkminer='/opt/networkminer'"
  else
  echo "Was not able to locate .bash_aliases in ${HOME} please check script."
  echo -e "/"networkminer/" alias was not added to the enviroment. 
  cd ${cwd}
  fi
;;
2)
  echo "Removal scripting pending"
;;
*)
  echo "Yo man I said i/r not whatever $install_Remove is. exiting..."
  exit 1
;;
esac

