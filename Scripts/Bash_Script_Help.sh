#!/bin/bash

#*******************************************************************************
#  (\_/)	Author: Bradley Stradling
#  (o.o)	Date of first revision: Tue 15 Sep 2020 07:29:24 PM EDT
# (")_(")	Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)		A neat little script to help hand out the syntax for different
# (*.*) 	tasks within a bash script.
#(")_(")	Credit and respect to https://devhints.io/bash
#*******************************************************************************

echo "#**************************************************************"

echo -e "#  (\_/)\t\n#  (o.o)\tWelcome to Bradleys Bash_Script_Helper\n# (\")_(\")\t"

echo "#**************************************************************"

echo -e "\n"

echo -e "\"1\" basic loop\t\t \"2\" c-like loop\t \"3\" ranged loops\t"

read -p "What can the rabbit assist you with on this fine day? <--" output_Choice

echo $output_Choice

case $output_Choice in

	1)
		echo -e "for i in x; do\n\techo \$i\ndone"
	;;
	2)
		echo -e "for ((i = 0 ; i < 10 ; i++)); do\n\techo \$i\ndone"
	;;
	3)
		echo -e ""
	;;
	4)
		echo -e ""
	;;
	5)
		echo -e ""
	;;
	*)
		echo "Exiting Script because I have no clue what you typed o.O"
	;;
esac
