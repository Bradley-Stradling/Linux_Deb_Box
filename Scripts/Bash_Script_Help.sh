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

echo "credit to https://devhints.io/bash for the info"

echo -e "\"1\" basic loop\t\t \"2\" c-like loop\t \"3\" ranged loops\t"

echo -e "\"4\" line read loop\t\t \"5\" while loop\t \"6\" conditionals\t"

echo -e "\"7\" basic function syntax and call\t \"8\" brace expansion\t \"9\" arguments\t"

echo -e "\"10\" file conditionals\t \"11\" defining arrays\t \"12\" working on arrays\t"

echo -e "\"13\" array operations\t \"14\" defining dictionaries\t \"15\" working on dictionaries\t"

echo -e "\"16\" dictionary iteration\t \"17\" options\t \"18\" glob options\t"

echo -e "\"19\" history commands\t \"20\" history expansion\t \"21\" history operations\t"

echo -e "\"22\" history slices\t \"23\" subshells\t \"24\" isnpect a command\t"

echo -e "\"25\" history slices\t \"26\" subshells\t \"27\" isnpect a command\t"

echo -e "\"28\" redirection\t \"29\" trap errors\t \"30\" case/switch\t"

echo -e "\"31\" special variables\t \"32\" check cmd result\t \"33\" grep check\t"

read -p "What can the rabbit assist you with on this fine day? <--" output_Choice

echo $output_Choice

case $output_Choice in

	1)
		echo -e "basic loop\n"
		echo -e "for i in x; do\n\techo \$i\ndone"
	;;
	2)
		echo -e "\n"
		echo -e "for ((i = 0 ; i < 10 ; i++)); do\n\techo \$i\ndone"
	;;
	3)
		echo -e "\n"
		echo -e "for i in {5..10}; do\n\techo \"Stay a while and listen $i\"\ndone"
		echo "With a step size of 3"
		echo -e "for i in {12..36..3}; do\n\techo \"Stay a while and listen $i\"\ndone"
		echo "iterating an array"
		echo -e "for i in \"${array_Name[@]}\"; do"
		echo "cmd $i"
		echo "done"
	;;
	4)
		echo -e "\n"
		echo -e "cat file | while read line; do\n\t echo $line"
	;;
	5)
		echo -e "\n"
		echo -e "while [[ \"$A\" == \"$B\" ]]; do\n\t {perform an action}\n done"
	;;
	6)
		echo -e "\n"
		echo -e "if [[ -flag \"$variable\" ]]; then"
		echo -e "\t cmd \"do a thing\""
		echo -e "elif [[ -anotherflag \"$variable\" ]]; then"
		echo -e "\t cmd \"do a thing\""
		echo "fi"
		
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
	7)
		echo -e "\n"
		echo -e "do_A_Thing() {"
		echo -e "\tdoing a thing"
		echo -e "}"
		echo -e "cmd $(do_A_Thing)"
		
		echo -e "passing values into function, \"function\" can be used to declare a function but not needed"
		echo "function do_A_Thing() {"
		echo -e "cmd \"do a thing with $1\""
		echo "}"
		echo -e "do_A_Thing \"value\""
	;;
	8)
		echo -e "\n"
		echo "for all files in array/list from A to C, (A.ext B.ext, C.ext)"
		echo "cmd {A,C}.ext"
		echo "for all numbers in range of 15 to 20"
		echo "{15..20}"
		echo "for brace expansion with variable step size"
		echo "{50..200..25}
		echo "same as 50 75 100 125 150 175 200"
	;;
	9)
		echo -e "\n"
		echo "Arguments as below"
		echo -e "$#\tnumber of arguments"
		echo -e "$*\tall arguments"
		echo -e "$@\tall arguments from first"
		echo -e "$(number)\t1st, 2nd, 3rd etc argument"
		echo -e "$_\tlast argument of previous cmd"
	;;
	10)
		echo -e "\n"
		echo "File Conditionals"
		echo -e "[[ -e FILE ]]	Exists?"
		echo -e "[[ -r FILE ]]	Readable?"
		echo -e "[[ -h FILE ]]	Symlink?"
		echo -e "[[ -d FILE ]]	Directory?"
		echo -e "[[ -w FILE ]]	Writable?"
		echo -e "[[ -s FILE ]]	Size is > 0 bytes?"
		echo -e "[[ -f FILE ]]	is a File?"
		echo -e "[[ -x FILE ]]	Executable?"
		echo -e "[[ FILE1 -nt FILE2 ]]	1 is more recent than 2?"
		echo -e "[[ FILE1 -ot FILE2 ]]	2 is more recent than 1?"
		echo -e "[[ FILE1 -ef FILE2 ]]	Same files?"
	;;
	11)
		echo -e "\n"
		echo "array_Name=(value_1, value_2, value_3)"
		echo "or this can be performed by"
		echo -e array_Name=\"value_1\"
		echo -e array_Name=\"value_2\"
		echo -e array_Name=\"value_3\"
	;;
	12)
		echo -e "\n"
		echo -e "cmd ${array_Name[3]}\t 3rd element"
		echo -e "cmd ${array_Name[-2]}\t 2nd from last element"
		echo -e "cmd ${array_Name[@]}\t all elements space seperation"
		echo -e "cmd ${#array_Name[@]}\t numbers of elements"
		echo -e "cmd ${#array_Name}\t string length of 1st element"
		echo -e "cmd ${#array_Name[n]}\t string length of nth element"
		echo -e "cmd ${array_Name[@]:p:l}\t range from position p to length l"
		echo -e "cmd ${!array_Name[@]}\t key of all elements space seperated"
	;;
	13)
		echo -e "\n"
		echo "I need to work on array operations more before i make note of them"
	;;
	14)
		echo -e "\n"
		echo "aka associative arrays, hence -A"
		echo "declare -A genre"
		echo -e "genre[AngelMaker]\"Deathcore\""
		echo -e "genre[Metallica]\"Metal\""
		echo -e "genre[LambofGod]\"Groove Metal\""
	;;
	15)
		echo -e "\n"
		echo -e "${genre[AngelMaker]}\t# "
		echo -e "${genre[@]}\t# all values"
		echo -e "${!genre[@]}\t# all keys"
		echo -e "${#genre[@]}\t# number of elements"
		echo -e "unset genre[Metallica]\t# delete Metallica"
	;;
	16)
		echo -e "\n"
		echo "need to check if val actually has to be val, and key"
		echo -e "for val in \"${genre[@]}\"; do"
		echo -e "\tcmd $val"
		echo "done"
		echo "iteration over keys"
		echo -e "for key in \"${!genre[@]}\"; do"
		echo -e "\tcmd $key"
		echo "done"
	;;
	17)
		echo -e "\n"
		echo -e "set -o noclobber\t# Avoid overlay files (echo \"hi\" > foo)"
		echo -e "set -o errexit\t# Used to exit upon error, avoiding cascading errors"
		echo -e "set -o pipefail\t# Unveils hidden failures"
		echo -e "set -o nounset\t# Exposes unset variables"
	;;
	18)
		echo -e "\n"
		echo "need to play with these, for more understanding"
		echo -e "shopt -s nullglob    # Non-matching globs are removed  ('*.foo' => '')"
		echo -e "shopt -s failglob    # Non-matching globs throw errors"
		echo -e "shopt -s nocaseglob  # Case insensitive globs"
		echo -e "shopt -s dotglob     # Wildcards match dotfiles ("*.sh" => ".foo.sh")"
		echo -e "shopt -s globstar    # Allow ** for recursive matches ('lib/**/*.rb' => 'lib/a/b/c.rb')"
		echo -e "Set GLOBIGNORE as a colon-separated list of patterns to be removed from glob matches."
	
	;;
	19)
		echo -e "\n"
	;;
	20)
		echo -e "\n"
	;;
	21)
		echo -e "\n"
	;;
	22)
		echo -e "\n"
	;;
	23)
		echo -e "\n"
	;;
	24)
		echo -e "\n"
	;;
	25)
		echo -e "\n"
	;;
	26)
		echo -e "\n"
	;;
	27)
		echo -e "\n"
	;;
	28)
		echo -e "\n"
	;;
	29)
		echo -e "\n"
	;;
	30)
		echo -e "\n"
	;;
	31)
		echo -e "\n"
	;;
	32)
		echo -e "\n"
	;;
	33)
		echo -e "\n"
	;;
	*)
		echo "Exiting Script because I have no clue what you typed o.O"
	;;
esac
