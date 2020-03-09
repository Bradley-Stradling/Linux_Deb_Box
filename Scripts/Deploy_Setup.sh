#!/bin/bash

# incomplete and untested as is!!!

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to be run after pulling the repo to a new box
# (*.*)   or account. Should be run from home directory? Could be used for a
#(")_(")  root account? Needs testing. Wherever the target .bashrc is.
#*******************************************************************************

# Lot of new code added to script needs to be tested.

# Need to look into making functions for some sections as code is getting long
# May look into creating directories based on prompt input

# Grab current working directory and store in variable cwd
cwd=$(pwd)

# Need to add prompt to ask for dependancies before script run y/n

read -p "Please enter the full path the the Linux_Deb_Box repo -->" Repo_Path

source_Dir=Sources
test_Dir=Test_Boxs
scripts_Dir=My_Scripts
back_Up_Dir=Back_Up_Files
bashrc_Dir=Set-up

# files to be created for writing source paths to
pathz_File=Paths.txt
workz_File=Workpath.txt

# array of files to be created here?

#concatenating paths to easier to work with variables
path_Source_Dir=${cwd}/${source_Dir}
path_Test_Dir=${cwd}/${test_Dir}
path_Scripts_Dir=${cwd}/${scripts_Dir}
path_Back_Up_Dir=${cwd}/${back_Up_Dir}

# array of created directories for iteration
list_Directories=(
'${path_Source_Dir}'
'${path_Test_Dir}'
'${path_Scripts_Dir}'
'${path_Back_Up_Dir}'
'${path_Back_Up_Dir}/${bashrc_Dir}'
)

# loop creations of new directories  # may want to loop creation and checks together
for directory in "${list_Directories}";
do
mkdir ${directory}
done
# make new directories this can be omitted once loop creation is tested
# mkdir ${path_Sources_Dir}
# mkdir ${path_Test_Dir}
# mkdir ${path_Scripts_Dir}
# mkdir ${path_Back_Up_Dir}
# mkdir ${path_Back_Up_Dir}/${bashrc_Dir}

# for if error check here for directories
for directory in "${list_Directories}";
do
if [ -d ${directory} ]; then
echo "New directory path created as: ${directory}"
else
echo "Failed to created directory path as: ${directory}"
fi
done

# lock down directories in home or root.
# this may break this box depending on where deployment is launched from
# needs further testing and likely if confirmation message
for directory in $(ls ${cwd});
do
chmod 600 ${path_Scripts_Dir}/${directory}
echo "Permission set to ${directory} to user only read write"
done

touch ${path_Sources_Dir}/${pathz_File}
touch ${path_Sources_Dir}/${workz_File}

for file in ${list_Files};
do
if [ -f $file];
then
echo "${file} has been created successfully!"
else
echo "${file} was not created sucessfully :("
fi
done

# write variable for paths to path source file
echo "source_Path=${path_Sources_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path=${path_Test_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "scripts_Path=${path_Scripts_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "back_Up_Files_Path=${path_Back_Up_Dir}" >> ${path_Sources_Dir}/${pathz_File}
# target for change work to change work target with go work alias
echo "work_Path_File=${path_Sources_Dir}/${workz_File}" >> ${path_Sources_Dir}/${pathz_File}

# confrim to terminal output paths written to files
echo "source_Path=${path_Sources_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "test_Path=${path_Test_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "scripts_Path=${path_Scripts_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "back_Up_Files_Path=${path_Back_Up_Dir} written to ${path_Sources_Dir}/${pathz_File}"
# target for change work to change work target with go work alias
echo "work_Path_File=${path_Sources_Dir}/${workz_File} written to ${path_Sources_Dir}/${pathz_File}"

# back up the .bashrc
cp .bashrc ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak
# confirm to terminal back up of bashrc
echo ".bashrc backed up to ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak"

# add scripts directory to my path.
echo "# Added path to my scripts directorys." >> .bashrc
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\"" >> .bashrc
echo "source ${path_Sources_Dir}/${pathz_File}" >> .bashrc

# confrim what is appended to bashrc
echo "# Added path to my scripts directorys. written to .bashrc"
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\" written to .bashrc"
echo "source ${path_Sources_Dir}/${pathz_File} written to .bashrc"


# add aliases file
cp ${Repo_Path}/aliases .bash_aliases
# confirm to terminal aliases file copied
if [ -f .bash_aliases];
then
echo "${Repo_Path}/aliases copied to .bash_aliases"
else
echo "${Repo_Path}/aliases was not copied to .bash_aliases"
fi

# prepend source of path file to aliases file
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${pathz_File} prepended to .bash_aliases"
# prepend
echo "source ${path_Sources_Dir}/${workz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${workz_File} prepended to .bash_aliases."

# add cp of scripts to Scripts folder from repo
cp ${Repo_Path}/Scripts/* ${path_Scripts_Dir}
echo "${Repo_Path}/Scripts/ copied to ${path_Scripts_Dir}"

# attempting to prepend source file to all scripts 
for script in $(ls ${path_Scripts_Dir});
do
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - ${path_Scripts_Dir}/$script > \
${path_Scripts_Dir}/temp && mv ${path_Scripts_Dir}/temp ${path_Scripts_Dir}/$script
echo "source ${path_Sources_Dir}/${pathz_File} prepended to ${path_Scripts_Dir}/$script"
done

for script in $(ls ${path_Scripts_Dir});
do
chmod 700 ${path_Scripts_Dir}/$script
echo "Permission set to ${path_Scripts_Dir}/$script to user only read write execute"
done

# need to add removal of common unwanted directories
