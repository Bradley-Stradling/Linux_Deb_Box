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

if [ euid != 0 ] # syntax for euid variable is nowhere close to correct!!!
echo "you must run this script as root or with root permissions sorry"
exit 1
fi

cwd=$(pwd)

echo -p "Would you like to install or remove networkminer and all of its dependancies? i/r"



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
cd $HOME ## this needs to set to either users directory, or who am i kinding networkminer needs root..?

# check if .bash_aliases was located properly.
if [ -f .bash_aliases ]; # need to check syntax here
then
echo "alias networkminer='/opt/networkminer'"
else
echo "Was not able to locate .bash_aliases in ${HOME} please check script."
echo -e "/"networkminer/" alias was not added to the enviroment. 
cd ${cwd}
fi


