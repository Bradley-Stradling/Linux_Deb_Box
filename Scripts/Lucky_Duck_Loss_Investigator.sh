#!/bin/bash

#*******************************************************************************
# Title: Lucky_Duck_Loss_Investigator
# Author: Bradley Stradling
# Date of release: 2/29/2020
# Version: 1.3
#-------------------------------------------------------------------------------
# This script will create a master ${Company}${direct} directory within the current
# working directory then a $game${sub_Dir} pull the .zip logs and
# unzip them into the investigation folder maintaining the original files.
#
# No user inputs can contain a space between words.
# Game input is case and spelling senstive to the logs.
#
# If log files come in with a different format or are altered the awk lines
# will need to be altered to reflect the change.
#
# This script was desgined to trim down logs to more pertinent info while
# maintaining their original composition at each data stream for integrity.
#-------------------------------------------------------------------------------
# Future improvements: Option input to select number of needed days.
#   General error checking.
#
# Implementation:
#   If investigation directory will be static comment out ${Company}${direct}
#  ${cwd} input and set the variables to the directories.
#
#*******************************************************************************

direct="_Investigations"
sub_Dir="_loss_Investigations"
sub_Sub_Dir_1="Player_Analysis"
sub_Sub_Dir_2="Dealer_Analysis"
sub_Sub_Dir_3="Player_Dealer_Analysis"
Log_dir="Logs_Raw"

echo "Hello welcome the Breadleys Investigator"
echo "The following prompts are case senstive to the file names in the .zip folders" 
echo "" # new line

# Grab user input
read -p "Please Enter the Company Name -->" Company
read -p "Please enter what game (Spelling matters) -->" Game
read -p "Please Enter the week in MMDD -->" Week
read -p "Please enter the 1st day -->" Day_1
read -p "Please enter the 2nd day -->" Day_2
read -p "Please enter the 3rd day -->" Day_3
read -p "Please enter the full path to the .zip files -->" File_Spot

# Grab current working directory
cwd=$(pwd)

# Make directories
mkdir $cwd/${Company}${direct}
mkdir $cwd/${Company}${direct}/${Game}${sub_Dir}
mkdir $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}
mkdir $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}
mkdir $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_3}

# Place to put our raw logs
mkdir ${Company}${direct}/${Game}${sub_Dir}/${Log_dir}

# Add note files
touch $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}/Notes_${sub_Sub_Dir_1}.txt
touch $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/Notes_${sub_Sub_Dir_2}.txt
touch $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_3}/Notes_${sub_Sub_Dir_3}.txt

# Move to location of .zip logs
cd $File_Spot

# Unzip all logs
unzip \*.zip

# Copy all logs to workspace directory (this includes the .zips)
cp -r * $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}

# Move to raw logs directory
cd $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}

# Remove .zips from worksapce logs directory
find . -name "*.zip" -type f -delete

# Move needed logs into respective workspace locations
cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Dealer_Schedules_$Week/${Day_1}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/

cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Dealer_Schedules_$Week/${Day_2}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/

cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Dealer_Schedules_$Week/${Day_3}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/

cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Roulette_Player_WinLoss_$Week/${Day_1}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}/

cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Roulette_Player_WinLoss_$Week/${Day_2}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}/

cp -r $cwd/${Company}${direct}/${Game}${sub_Dir}/${Log_dir}/Roulette_Player_WinLoss_$Week/${Day_3}* \
$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}/

# Move to player analysis
cd $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_1}

# Collect lines containing losses
grep "-" * > Roulette_Losses

# Grabs all names out of the losses file and counts them. this section to the next awk could be done better...
awk '{ for (i=4; i<=NF; i++) print $i}' Roulette_Losses > Players_Most_during_losses3.txt

cat Players_Most_during_losses3.txt | tr ',' '\n' > Players_Most_during_losses2.txt

cat Players_Most_during_losses2.txt | sort | uniq -c | sort -nr > Players_Most_during_losses.txt

rm Players_Most_during_losses3.txt

rm Players_Most_during_losses2.txt

awk '{print $1 " " $2}' Roulette_Losses | cut -c '1-5 27-37' | sed 's/_/ /' > Dates_And_Times_Losses.txt

# copy times of loss to dealer analysis for easier viewing
cp Dates_And_Times_Losses.txt $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/

# Move to Dealer_Analysis
cd $cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}

# All Dealer logs contain a space on each line combining them for data stream
grep " " * > Consolidated_Dealer_List.txt

# Switch here could be more efficient for now outputing all dealers by date and time.
awk '{print $1,$2,$3,$4}' Consolidated_Dealer_List.txt | cut -c '1-5 22-' | sed 's/_/ /' \
| sed '/Hour/d' > /$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/Clean_BlackJack_Dealer_List.txt

awk '{print $1,$2,$5,$6}' Consolidated_Dealer_List.txt | cut -c '1-5 22-' | sed 's/_/ /' \
| sed '/Hour/d' > /$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/Clean_Roulette_Dealer_List.txt

awk '{print $1,$2,$7,$8}' Consolidated_Dealer_List.txt | cut -c '1-5 22-' | sed 's/_/ /' \
| sed '/Hour/d' > /$cwd/${Company}${direct}/${Game}${sub_Dir}/${sub_Sub_Dir_2}/Clean_BlackJack_Dealer_List.txt

# missing functionality to concatenate dealer alongside times of losses. but dealer lookup script should work for now.
