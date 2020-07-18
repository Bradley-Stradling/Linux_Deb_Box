#*******************************************************************************
# (\_/)                Author: Bradley Stradling                          (\_/)
# (o.o)                 Title: Linux_Deb_Repo                             (*.*)
#(")_(")             Lincense: https://unlicense.org/                    (")_(")
#*******************************************************************************
Aliases and scripts for my linux debian bash user enviroment set-up imported 
via "Deploy_Setup.sh".

Unlicense applies to all files that are tagged with it directly in this 
repository. Links to websites are not my sites in any manner.

This repo may be cloned or pulled to a debian based linux system. Copying the 
"Deploy_Setup.sh" to the desired user account home directory and executing will
prompt a confirmation and the path to the repo folder, then deploy my aliases
and scripts to the enviroment sourcing the local paths where needed.

--------------------------------Script list------------------------------------

Add_Alias.sh - Prompts user input for a comment and an alias then appends it to 
the .bash_aliases in the users home directory and returns to whatever directory 
the user was in previously. (Also reexecutes the shell so new alias is 
immediately available.)

Back_Me_Up.sh - Copies the contents of the entire current directory to a new 
directory in back up directory with the name of the passed argument. Meant to 
back up files in current directory for instance snapshot a repo and date it.

Change_Work.sh - Changes the variable source for gowork to change the current 
focus directory. At will change of gowork alias that simply cd's to the 
variables target path.

Copy_Contents_Move.sh - Copies the entire contents of the current directory 
to the passed target path.

Deploy_Setup.sh - Deploys the contents of this repo for immediate use.
Creates a few directories and sources their local paths to aliases, bashrc, 
and scripts to ease setting up a new debian system.

Enum_User_Directory.sh - Enumerate all files and directories below the 
current working directory. (needs parsing)

Get_Linux_Info.sh - Script to pull some info about the current system and 
either display on screen write it to a file in cwd or both.

Harden_Etc.sh - Sets permissions to root only on some /etc files. 
Must be run as root. (Needs further checking of user status and location.)

Make_Script.sh - Creates a new script with the passed argument as a name with 
my comment header output pregenerated to the file as well as prompts to 
set executable permission to user only.

NVM_Installer.sh - Script to install/uninstall networkminer and dependancies 
on a debian based system. (incomplete untested)

Resolution_Set.sh - adds 1920x1080p to xrandr.

Update.sh - Will run updates for the the system must be have sudoer
permissions. (untested)

Unzip_and_Move.sh - Needs refactor. But will ideally unzip all files in a 
target directory and copy a backup as the .zip still and unpack to 
the current working directory. (incomplete untested)

Pcapng_to_pcap.sh - Lickity split script to convert pcapng to pcap.
(incomplete untested)
