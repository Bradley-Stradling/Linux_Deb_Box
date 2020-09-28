#*******************************************************************************
# (\_/)                Author: Bradley Stradling                          (\_/)
# (o.o)                 Title: Linux_Deb_Repo                             (*.*)
#(")_(")             Lincense: https://unlicense.org/                    (")_(")
#*******************************************************************************
Aliases and scripts for my linux debian bash user enviroment set-up imported 
via "Deploy_Setup.sh".

***** "Deploy_Setup.sh" has had big changes without testing as of 9/28/20, 
use caution!!! likely broken? hopefully not though*****

Unlicense applies to all files that are tagged with it directly in this 
repository. Links to websites are not my sites in any manner.

This repo may be cloned or pulled to a debian based linux system. Copying the 
"Deploy_Setup.sh" to the desired user account home directory and executing will
prompt for a confirmation and the path to the repo folder, then deploy my aliases
and scripts to the enviroment sourcing the local paths where needed.

Feel free to clone and make use of this repo on your own, you could replace 
the entire alias file, change what directories are created, add new scripts
and reupload to your own repo and have access to your debian setup from
anywhere with an internet connection.

A little POC (https://youtu.be/6dLt1Ke5G74)

--------------------------------Script list------------------------------------

Add_Alias.sh - Prompts user input for a comment and an alias then appends it to 
the .bash_aliases in the users home directory and returns to whatever directory 
the user was in previously. (Also reexecutes the shell so new alias is 
immediately available.)

Back_Me_Up.sh - Copies the contents of the entire current directory to a new 
directory in back up directory with the name of the passed argument. Meant to 
back up files in current directory for instance snapshot a repo and date it.

Bash_Script_Help.sh - A case script with notes on the syntax of many bash 
functions and options used in scripts. Loop syntax for example. 33 option
notes so far.

Change_Work.sh - Changes the variable sources for the gowork aliases,
theres now 3 gowork aliases! so up to 3 paths can be stored and recalled.

Copy_Contents_Move.sh - Copies the entire contents of the current directory 
to the passed target path.

Deploy_Setup.sh - Deploys the contents of this repo for immediate use.
Creates a few directories and sources their local paths to aliases, bashrc, 
and scripts to ease setting up a new debian system.

Get_Linux_Info.sh - Script to pull some info about the current system and 
either display on screen, write it to a file in cwd or both.

Make_Script.sh - Creates a new script with the passed argument as a name with 
my comment header output pregenerated to the file as well as prompts to 
set executable permission to user only.

NVM_Installer.sh - Script to install/uninstall networkminer and dependancies 
on a debian based system. (incomplete untested)

Resolution_Set.sh - adds 1920x1080p to xrandr. Super useful for virtual
systems!

Pcapng_to_pcap.sh - Lickity split script to convert pcapng to pcap.

Pentest_Help.sh - A Case script listing some of the needed commands during
Penetration testing, basically blank for now, but intended to house commands
such as upgrading a dummy shell with python, or a quick python server etc.

---------------------------------- FUTURE -------------------------------------

Scripts to configure common linux system admin and security functions, password
policies, file permissions, system hardening. Automate some tripwire setup maybe?

Determine baseline security tools needed for penetration testing and create a
script to get them installed to Ubuntu or a less security oriented dstribution,
for quick and easy Ubunhack, or Minty Hacks?
