#!/bin/bash

# functional other than confirmation ouput of created files.

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to be run after pulling the repo to a new box
# (*.*)   or account. Replaces the bash_aliases file, and appends an export to
#(")_(")  add the scripts folder to path.
#*******************************************************************************


# Grab current working directory and store in variable cwd
cwd=$(pwd)

read -p "is the current working directory of ${cwd} where you want to \
deploy set-up? y/n -->" setup_Check

if [ $setup_Check != 'y' ];
then
echo "Alright then don't run the script here >.> exiting..."
echo -e " (\_/)\n (v.v) Sad Rabbit...\n(\")_(\")"
exit 1
fi

read -p "Please enter the full path the the Linux_Deb_Box repo -->" Repo_Path

# check repo path is reachable
if [ -d ${Repo_Path} ];
then
  echo "Path to linux_Deb_Repo found successfully as ${Repo_Path}"
  else
  echo "Unfortunately ${Repo_Path} was not found exiting script."
  echo -e " (\_/)\n (v.v) Sad Rabbit...\n(\")_(\")"
  exit 1
fi

# these currently help to name directories
source_Dir=Sources
test_Dir=Test_Boxs
test_Dir1=1_Test
test_Dir2=2_Test
test_Dir3=3_Test
scripts_Dir=My_Scripts
back_Up_Dir=Back_Up_Files
bashrc_Dir=Set-up

# files to be created for writing source paths to
pathz_File=Paths.txt
workz_File=Workpath.txt

#concatenating paths to easier to work with variables
path_Sources_Dir=${cwd}/${source_Dir}
path_Test_Dir=${cwd}/${test_Dir}
path_Test_Dir1=${cwd}/${test_Dir}/${test_Dir1}
path_Test_Dir2=${cwd}/${test_Dir}/${test_Dir2}
path_Test_Dir3=${cwd}/${test_Dir}/${test_Dir3}
path_Scripts_Dir=${cwd}/${scripts_Dir}
path_Back_Up_Dir=${cwd}/${back_Up_Dir}

# array of created directories for iteration
list_Directories=(
"${path_Sources_Dir}"
"${path_Test_Dir}"
"${path_Scripts_Dir}"
"${path_Back_Up_Dir}"
"${path_Back_Up_Dir}/${bashrc_Dir}"
"${path_Test_Dir1}"
"${path_Test_Dir2}"
"${path_Test_Dir3}"
)

# array of files to be created for iteration
list_Files=(
"${path_Sources_Dir}/${pathz_File}"
"${path_Sources_Dir}/${workz_File}"
)

echo " "

# make new directories and check them
for directory in "${list_Directories[@]}";
do
  mkdir ${directory}
    if [ -d ${directory} ]; then
    echo "New directory path created as: ${directory}"
    else
    echo "Failed to created directory path as: ${directory}"
    fi
done

echo " "

for file in "${list_Files[@]}";
  do
  touch ${file}
  if [ -e {$file} ]; # if check for file is not working in this implementation...
  # maybe try -f?
    then
    echo "${file} has been created successfully!"
    else
    echo "${file} was not created sucessfully :("
  fi
done

# this should be done with a method/loop that takes the below variables 
# from arrays/lists of paths earlier including confirmation output
# work to be done.
# write variable for paths to path source file
echo "source_Path=${path_Sources_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path=${path_Test_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path1=${path_Test_Dir1}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path2=${path_Test_Dir2}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path3=${path_Test_Dir3}" >> ${path_Sources_Dir}/${pathz_File}
echo "scripts_Path=${path_Scripts_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "back_Up_Files_Path=${path_Back_Up_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "repo_Path=${Repo_Path}" >> ${path_Sources_Dir}/${pathz_File}
# target for change work to change work target with go work alias
echo "work_Path_File=${path_Sources_Dir}/${workz_File}" >> ${path_Sources_Dir}/${pathz_File}

echo " "

# confrim to terminal output paths written to files
echo "source_Path=${path_Sources_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "test_Path=${path_Test_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "scripts_Path=${path_Scripts_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "back_Up_Files_Path=${path_Back_Up_Dir} written to ${path_Sources_Dir}/${pathz_File}"
# target for change work to change work target with go work alias
echo "work_Path_File=${path_Sources_Dir}/${workz_File} written to ${path_Sources_Dir}/${pathz_File}"

echo " "

# back up the .bashrc
cp .bashrc ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak
# confirm to terminal back up of bashrc
echo ".bashrc backed up to ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak"

echo " "

# add scripts directory to my path.
echo "# Added path to my scripts directorys." >> .bashrc
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\"" >> .bashrc
echo "source ${path_Sources_Dir}/${pathz_File}" >> .bashrc

echo " "

# confrim what is appended to bashrc
echo "# Added path to my scripts directorys. written to .bashrc"
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\" written to .bashrc"
echo "source ${path_Sources_Dir}/${pathz_File} written to .bashrc"

# move current .bash_aliases if it already exists to back up directory.
if [ -f .bash_aliases ];
  then
  echo "Moved previous .bash_aliases to ${path_Back_Up_Dir}/${bashrc_Dir}"
  echo ""
  mv .bash_aliases ${path_Back_Up_Dir}/${bashrc_Dir}
fi

# add aliases file from repo
cp ${Repo_Path}/aliases .bash_aliases
# confirm to terminal aliases file copied
if [ -f .bash_aliases ];
  then
  echo "${Repo_Path}/aliases copied to .bash_aliases"
  else
  echo "${Repo_Path}/aliases was not copied to .bash_aliases"
fi

echo " "

# prepend source of path file to aliases file
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${pathz_File} prepended to .bash_aliases"
# prepend
echo "source ${path_Sources_Dir}/${workz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${workz_File} prepended to .bash_aliases."

# add cp of scripts to Scripts folder from repo
# may want to change this to loop iteration and check each file as it's copied
# and output to terminal file copy success for each script
cp ${Repo_Path}/Scripts/* ${path_Scripts_Dir}
echo "${Repo_Path}/Scripts/ copied to ${path_Scripts_Dir}"

echo " "

# attempting to prepend source file to all scripts 
for script in $(ls ${path_Scripts_Dir});
do
echo "source ${path_Sources_Dir}/${pathz_File}" | cat - ${path_Scripts_Dir}/$script > \
${path_Scripts_Dir}/temp && mv ${path_Scripts_Dir}/temp ${path_Scripts_Dir}/$script
echo "source ${path_Sources_Dir}/${pathz_File} prepended to ${path_Scripts_Dir}/$script"
done

echo " "

for script in $(ls ${path_Scripts_Dir});
do
chmod 700 ${path_Scripts_Dir}/$script
echo "Permission set to ${path_Scripts_Dir}/$script to user only read write execute"
done
