#!/bin/bash

#*******************************************************************************

#Make directories
mkdir Lucky_Duck_Investigations
mkdir Lucky_Duck_Investigations/Roulette_loss_Investigation
mkdir Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis
mkdir Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis
mkdir Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Dealer_Analysis
#place to put our raw logs
mkdir Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw

#Add note files
touch Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis/Notes_Player_Analysis
touch Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/Notes_Dealer_Analysis
touch Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Dealer_Analysis/Notes_Player_Dealer_Analysis

cd /home/bread/Downloads

unzip \*.zip

cp -r * /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw

cd /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw

find . -name "*.zip" -type f -delete

cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Dealer_Schedules_0310/0310* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/
cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Dealer_Schedules_0310/0312* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/
cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Dealer_Schedules_0310/0315* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/

cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Roulette_Player_WinLoss_0310/0310* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis/
cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Roulette_Player_WinLoss_0310/0312* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis/
cp -r /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Logs_Raw/Roulette_Player_WinLoss_0310/0315* /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis/

cd /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Player_Analysis

grep "-" * > Roulette_Losses

awk '{print $1 " " $2}' Roulette_Losses | cut -c '1-5 27-37' | sed 's/_/ /' > Dates_And_Times_Losses

cd /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis

grep " " * > Consolidated_Dealer_List

awk '{print $1,$2,$3,$4}' Consolidated_Dealer_List | cut -c '1-5 22-' | sed 's/_/ /' | sed '/Hour/d' > /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/Clean__BlackJack_Dealer_List

awk '{print $1,$2,$5,$6}' Consolidated_Dealer_List | cut -c '1-5 22-' | sed 's/_/ /' | sed '/Hour/d' > /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/Clean__Roulette_Dealer_List

awk '{print $1,$2,$7,$8}' Consolidated_Dealer_List | cut -c '1-5 22-' | sed 's/_/ /' | sed '/Hour/d' > /home/bread/Documents/TestBox/Lucky_Duck_Investigations/Roulette_loss_Investigation/Dealer_Analysis/Clean__BlackJack_Dealer_List
