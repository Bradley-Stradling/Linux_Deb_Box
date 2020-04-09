#*******************************************************************************
# (\_/)                Author: Bradley Stradling                          (\_/)
# (o.o)                 Title: Linux_Deb_Repo                             (*.*)
#(")_(")             Lincense: https://unlicense.org/                    (")_(")
#*******************************************************************************
Aliases and scripts for my linux debian bash set-up imported and exported via 
Deploy_Setup.sh and Pack_Up_Setup.sh.

Unlicense applies to all files that are tagged with it directly in this 
repository.

Refactoring of scripts ongoing, some may be broken at any time. 
Should be tagged (# incomplete and untested !!!)

These scripts misused, in a broken or untested state, or unmonitored may 
cause file loss. 

--------------------------------Script list------------------------------------
Add_Alias.sh - Prompts user input for a comment and an alias appends it to the
.bash_aliases in the users home directory and returns to whatever directory 
the user was in previously. (Also reexecutes the shell so new alias is 
immediately available.)

Back_Me_Up.sh - Copies the contents of the entire current directory to a new 
directory in back up directory with the name of the passed argument. Meant to 
back up files in current directory for instance snapshot a repo and date it.
(maybe append date to passed name?)

Change_Work.sh - Changes the variable source for gowork to change the current 
focus directory. At will change of gowork alias that simply cd's to the 
variables target path.

Copy_Contents_Move.sh - Copies the entire contents of the current directory 
to the passed target path.

Deploy_Setup.sh - Creates a few directories and sources their local paths 
to aliases, bashrc, and scripts to ease setting up a new debian system.

Enum_User_Directory.sh - Enumerate all files and directories below the 
current working directory. (Busted and not even started really yet :P)

Find_1_File.sh - Script to make finding a file easier. 

Get_Linux_Info.sh - Script to pull some info about the current system and 
either display on screen write it to a file in cwd or both.

Harden_Etc.sh - Sets permissions to root only on some /etc files. 
Must be run as root. Needs further checking of user status and location.

Make_Script.sh - Creates a new script with the passed argument as a name with 
some comment header output pregenerated to the file as well as sets executable 
permission to user only.

Pack_Up_Setup - This script has been removed to lower the chance of malicious 
code hiding in deployment.

Unzip_and_Move.sh - Needs refactor. But will ideally unzip all files in a 
target directory and copy them a backup as the .zip still and unpacked to 
the current working directory.
------------------------------Script list end----------------------------------

.........................Current production notes..............................
Todo-
Refactor Deploy_Setup.sh to make adding directories or files easier. (See comments)
Work on getting Pack_Up_Setup flushed out and tested. needs to cleanse lines 
with source from aliases and scripts so it does not have to be done 
manually when packing up the set-up.

Scripts coming in future: 
Resolution_set.sh - Write script to add new resolution to xrandr, 
and set a source for the screenrez script to change to that resolution. 
(See useful links for guide.)

Enum_User_Directory.sh - enumerate and list all files and directories within 
the current working directory and below.

Debian_Update.sh - not sure if auto update when called or used for a cron job.

Testing script changes 3/10/20

Add_Alias is good to go. 
Back_Me_Up is good to go.
Change_Work is good to go.
Deploy_setup is working correctly but has error in output confirmation of file check.

.......................End current production notes............................
