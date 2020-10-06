#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   This script is intended to be run after pulling the repo to a new box
# (*.*)   or account. Replaces the bash_aliases file, and appends an export to
#(")_(")  add the scripts folder to path.
#*******************************************************************************

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

if [ -d ${Repo_Path} ];
then
  echo "Path to linux_Deb_Repo found successfully as ${Repo_Path}"
  else
  echo "Unfortunately ${Repo_Path} was not found exiting script."
  echo -e " (\_/)\n (v.v) Sad Rabbit...\n(\")_(\")"
  exit 1
fi

source_Dir=Sources
test_Dir=Test_Boxs
test_Dir1=1_Test
test_Dir2=2_Test
test_Dir3=3_Test
scripts_Dir=My_Scripts
tools_Dir=My_Tools
back_Up_Dir=Back_Up_Files
bashrc_Dir=Set-up
back_Up_Scripts=Scripts_Back_Up

pathz_File=Paths.txt
workz_File_1=Workpath1.txt
workz_File_2=Workpath2.txt
workz_File_3=Workpath3.txt
tool_Lists_File=Tool_Lists.txt

path_Sources_Dir=${cwd}/${source_Dir}
path_Test_Dir=${cwd}/${test_Dir}
path_Test_Dir1=${cwd}/${test_Dir}/${test_Dir1}
path_Test_Dir2=${cwd}/${test_Dir}/${test_Dir2}
path_Test_Dir3=${cwd}/${test_Dir}/${test_Dir3}
path_Scripts_Dir=${cwd}/${scripts_Dir}
path_Tools_Dir=$${cwd}/{$tools_Dir}
path_Back_Up_Dir=${cwd}/${back_Up_Dir}

list_Directories=(
"${path_Sources_Dir}"
"${path_Test_Dir}"
"${path_Scripts_Dir}"
"${path_Tools_Dir}" # 
"${path_Test_Dir1}"
"${path_Test_Dir2}"
"${path_Test_Dir3}"
)

list_Back_Up_Directories=(
"${path_Back_Up_Dir}"
"${path_Back_Up_Dir}/${bashrc_Dir}"
"${path_Back_Up_Dir}/${back_Up_Scripts}"
)

list_No_Back_Up_Dirs={
"${path_Tools_Dir}"
}

# array of files to be created for iteration, may want to rename list to list_Create_Files
list_Files=(
"${path_Sources_Dir}/${pathz_File}"
"${path_Sources_Dir}/${workz_File_1}"
"${path_Sources_Dir}/${workz_File_2}"
"${path_Sources_Dir}/${workz_File_3}"
)

echo " "

for dir_Back_Up in "${list_Back_Up_Directories[@]}"
do
  if [ -d ${dir_Back_Up} ]; then
    echo "${dir_Back_Up} detected. Will not create another :)"
      else
      mkdir ${dir_Back_Up}
      if [ -d ${dir_Back_Up} ]; then
        echo "New directory path created as: ${dir_Back_Up}"
          else
            echo "Failed to created directory path as: ${dir_Back_Up}"
      fi
  fi
done

# make new directories and check them
for directory in "${list_Directories[@]}";
do
  # Loops in loops, hopefully this works the way its intended to skip a dir if its in the skip no back up list
  # may want to roll back this change and move to dealing with My_Tools entirely with Deploy_Tools
    for no_Back_Up_Directory in "${list_No_Back_Up_Dirs[@]}"
    do
      if [[ ${directory} == ${no_Back_Up_Directory} ]]; then
      skip_Dir="1"
      break
      fi
    done
          if [[ ${skip_Dir} == 1 ]]; then
            skip_Dir="0"
            break
          fi
    if [ -d ${directory} ]; then
        if [ -d ${path_Back_Up_Dir}${directory} ]; then
          echo "looks like ${directory} and ${path_Back_Up_Dir}${directory} already exist"
          read -p "would you like to overwrite the ${path_Back_Up_Dir}${directory} with ${directory} and its contents? y/n --\> " overwrite_Dir
          if [ $overwrite_Dir == y ]; then
            echo "clearing back up location at ${path_Back_Up_Dir}${directory}"
            rm -rf ${path_Back_Up_Dir}${directory}
            elif [ $overwrite_Dir != y ]; then
              echo "then please save your work and clear directories before deployment!! exiting.."
              exit 1;
          fi
        fi
      echo "${directory} already exists, backing up to ${path_Back_Up_Dir}${directory}"
      mkdir -p ${path_Back_Up_Dir}${directory}
      mv ${directory} ${path_Back_Up_Dir}${directory}
      mkdir ${directory}
      else
      mkdir ${directory}
      if [ -d ${directory} ]; then
        echo "New directory path created as: ${directory}"
          else
            echo "Failed to created directory path as: ${directory}"
      fi
    fi
done

echo " "

for file in "${list_Files[@]}";
  do
  touch ${file}
  if [ -f ${file} ]; then
    echo "${file} has been created successfully!"
      else
      echo "${file} was not created sucessfully :("
  fi
done

echo "source_Path=${path_Sources_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path=${path_Test_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path1=${path_Test_Dir1}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path2=${path_Test_Dir2}" >> ${path_Sources_Dir}/${pathz_File}
echo "test_Path3=${path_Test_Dir3}" >> ${path_Sources_Dir}/${pathz_File}
echo "scripts_Path=${path_Scripts_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "back_Up_Files_Path=${path_Back_Up_Dir}" >> ${path_Sources_Dir}/${pathz_File}
echo "repo_Path=${Repo_Path}" >> ${path_Sources_Dir}/${pathz_File}
# target for change work to change work target with go work alias
echo "work_Path_1=${path_Sources_Dir}/${workz_File_1}" >> ${path_Sources_Dir}/${pathz_File}
echo "work_Path_2=${path_Sources_Dir}/${workz_File_2}" >> ${path_Sources_Dir}/${pathz_File}
echo "work_Path_3=${path_Sources_Dir}/${workz_File_3}" >> ${path_Sources_Dir}/${pathz_File}

echo " "

echo "source_Path=${path_Sources_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "test_Path=${path_Test_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "scripts_Path=${path_Scripts_Dir} written to ${path_Sources_Dir}/${pathz_File}"
echo "back_Up_Files_Path=${path_Back_Up_Dir} written to ${path_Sources_Dir}/${pathz_File}"
# target for change work to change work target with go work alias
echo "work_Path_1=${path_Sources_Dir}/${workz_File_1} written to ${path_Sources_Dir}/${pathz_File}"
echo "work_Path_2=${path_Sources_Dir}/${workz_File_2} written to ${path_Sources_Dir}/${pathz_File}"
echo "work_Path_3=${path_Sources_Dir}/${workz_File_3} written to ${path_Sources_Dir}/${pathz_File}"

if [ -f ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc1.bak ]; then
  echo "restored .bashrc to state from before 1st run after backing up current .bashrc"
  cp .bashrc ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc.bak 
  cp ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc1.bak .bashrc
   else
    cp .bashrc ${path_Back_Up_Dir}/${bashrc_Dir}/bashrc1.bak
fi

echo " "

echo "# Added path to my scripts directorys." >> .bashrc
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\"" >> .bashrc
echo "# Added path to my tools directorys." >> .bashrc
echo "export PATH=\"{path_Tools_Dir}:\$PATH\"" >> .bashrc
echo "# Added sourcing of paths file" >> .bashrc
echo "source ${path_Sources_Dir}/${pathz_File}" >> .bashrc

echo " "

echo "# Added path to my scripts directorys. written to .bashrc"
echo "export PATH=\"${path_Scripts_Dir}:\$PATH\" written to .bashrc"
echo "# Added path to my tools directorys. written to .bashrc"
echo "export PATH=\"${path_Tools_Dir}:\$PATH\" written to .bashrc"
echo "# Added sourcing of paths file"
echo "source ${path_Sources_Dir}/${pathz_File} written to .bashrc"

echo " "

echo "# Added path to my tools directorys. written to .bashrc"
echo "export PATH=\"${path_Tools_Dir}:\$PATH\" written to .bashrc"

# Dupe this section and futz with it to place ${Repo_Path}/${tool_Lists_File} from repo to "${path_Tools_Dir}
# place backup 
if [ -f .bash_aliases ]; then
  if [ -f ${path_Back_Up_Dir}/${bashrc_Dir}/bash_aliases.bak ]; then
    read -p "Looks like .bash_aliases already exists in ${path_Back_Up_Dir}/${bashrc_Dir} would you like to overwrite it with the current .bash_aliases? y/n --" overwrite_Aliases
    if [ ${overwrite_Aliases} == y ]; then
      echo "clearing back up .bash_aliases from ${path_Back_Up_Dir}/${bashrc_Dir}"
      rm "${path_Back_Up_Dir}/${bashrc_Dir}/bash_aliases.bak"
    fi
  fi
  echo "Moved previous .bash_aliases to ${path_Back_Up_Dir}/${bashrc_Dir}"
  mv .bash_aliases "${path_Back_Up_Dir}/${bashrc_Dir}/bash_aliases.bak"
fi
cp ${Repo_Path}/aliases .bash_aliases
# confirm to terminal aliases file copied
if [ -f .bash_aliases ];
  then
  echo "${Repo_Path}/aliases copied to .bash_aliases"
  else
  echo "${Repo_Path}/aliases was not copied to .bash_aliases"
fi
# end of needed dupe

echo " "

echo "source ${path_Sources_Dir}/${pathz_File}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${pathz_File} prepended to .bash_aliases"
# prepend
echo "source ${path_Sources_Dir}/${workz_File_1}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${workz_File_1} prepended to .bash_aliases."
echo "source ${path_Sources_Dir}/${workz_File_2}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${workz_File_2} prepended to .bash_aliases."
echo "source ${path_Sources_Dir}/${workz_File_3}" | cat - .bash_aliases > temp \
 && mv temp .bash_aliases
echo "source ${path_Sources_Dir}/${workz_File_3} prepended to .bash_aliases."

echo " "

if [ -f ${path_Scripts_Dir}/Change_Work.sh ]; then # new conditional flag have not used it yet, hopefully it works as intended
    read -p "Looks like a ${path_Scripts_Dir} directory already exists with some scripts would you like to back them up? y/n -->" bak_Up_Scripts
    if [ ${bak_Up_Scripts} == y ]; then
      if [ -f ${path_Back_Up_Dir}/${back_Up_Scripts}/Change_Work.sh ]; then
        read -p "Looks like ${path_Back_Up_Dir}/${back_Up_Scripts} already has some scripts as well are you sure you want to overwrite it? y/n -->" overwrite_back_Up_Scripts
        if [ ${overwrite_back_Up_Scripts} == y ]; then
          rm ${path_Back_Up_Dir}/${back_Up_Scripts}/*
          echo "Back up scripts cleared out from ${path_Back_Up_Dir}/${back_Up_Scripts}"
            elif [ ${overwrite_back_Up_Scripts} != y ]; then
            echo "please save your work before running the Deploy.sh silly head exiting.."
            exit 1
        fi
      fi
        echo "Backing up scripts to ${path_Back_Up_Dir}/${back_Up_Scripts}"
        mv ${path_Scripts_Dir}/* ${path_Back_Up_Dir}/${back_Up_Scripts}
      elif [ ${back_Up_Scripts} != y ]; then
        echo "please save your work before running the Deploy.sh silly head exiting.."
        exit 1
    fi
  else 
    cp ${Repo_Path}/Scripts/* ${path_Scripts_Dir}
    echo "${Repo_Path}/Scripts/ copied to ${path_Scripts_Dir}"
fi
  
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
