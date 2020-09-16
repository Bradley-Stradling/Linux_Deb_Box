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

echo -e "\"4\" line read loop\t\t \"5\" while loop\t \"6\" condtionals\t"

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
		echo -e "for i in {5..10}; do\n\techo \"Stay a while and listen $i\"\ndone"
		echo "With a step size of 3"
		echo -e "for i in {12..36..3}; do\n\techo \"Stay a while and listen $i\"\ndone"
	;;
	4)
		echo -e "cat file | while read line; do\n\t echo $line"
	;;
	5)
		echo -e "while [[ \"$A\" == \"$B\" ]]; do\n\t {perform an action}\n done"
	;;
	6)
		echo -e "[[ is a command that returns a boolean value"
		echo -e "[ and [[ perform a similar function but [[ should be prefered "
		echo -e "[[ -z STRING ]]	Empty string"
		echo -e "[[ -n STRING ]]	Not empty string"
		echo -e "[[ STRING == STRING ]]	Equal"
		echo -e "[[ STRING != STRING ]]	Not Equal"
		echo -e "[[ NUM -eq NUM ]]	Equal"
		echo -e "[[ NUM -ne NUM ]]	Not equal"
		echo -e "[[ NUM -lt NUM ]]	Less than"
		echo -e "[[ NUM -le NUM ]]	Less than or equal"
		echo -e "[[ NUM -gt NUM ]]	Greater than"
		echo -e "[[ NUM -ge NUM ]]	Greater than or equal"
		echo -e "[[ STRING =~ STRING ]]	Regexp"
		echo -e "(( NUM < NUM ))	Numeric conditions"
		echo -e "[[ -o noclobber ]]	If OPTIONNAME is enabled"
		echo -e "[[ ! EXPR ]]	Not"
		echo -e "[[ X && Y ]]	And"
		echo -e "[[ X || Y ]]	Or"
	;;
	*)
		echo "Exiting Script because I have no clue what you typed o.O"
	;;
esac
