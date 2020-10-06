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


# syntax should be, need to manually check outputs for readbility
# might be a really good opportunity to dip into coloring outputs

###
echo "!!!NOTE this is untested!!!!"
read -p " Are you sure you meant to run this script before it's been fully tested?? y/n -->" run_Script

if [[ ${run_Script} != y ]]; then
  echo -e "Then please be careful running scripts that are unfinished \:P exiting.."
  exit 1
fi
###

echo "#**************************************************************"

echo -e "#  (\_/)\t\n#  (o.o)\tWelcome to Bradleys Bash_Script_Helper\n# (\")_(\")\t"

echo "#**************************************************************"

echo -e "\n"

echo "credit to https://devhints.io/bash for the info"

echo -e "\"1\" basic loop\t\t\t \"2\" c-like loop\t\t \"3\" ranged loops\t"

echo -e "\"4\" line read loop\t\t \"5\" while loop\t\t\t \"6\" conditionals\t"

echo -e "\"7\" basic function syntax\t \"8\" brace expansion\t\t \"9\" arguments\t"

echo -e "\"10\" file conditionals\t\t \"11\" defining arrays\t\t \"12\" working on arrays\t"

echo -e "\"13\" array operations\t\t \"14\" defining dictionaries\t \"15\" working on dictionaries\t"

echo -e "\"16\" dictionary iteration\t \"17\" options\t\t\t \"18\" glob options\t"

echo -e "\"19\" history commands\t\t \"20\" history expansion\t\t \"21\" history operations\t"

echo -e "\"22\" history slices\t\t \"23\" subshells\t\t\t \"24\" inspect a command\t"

echo -e "\"25\" random number\t\t \"26\" arithemetic\t\t \"27\" getting options\t"

echo -e "\"28\" redirection\t\t \"29\" trap errors\t\t \"30\" sourcing\t"

echo -e "\"31\" special variables\t\t \"32\" check cmd result\t\t \"33\" grep check\t"

while [[ ${output_Choice} != "e" ]]; do

echo " "

read -p "What can the rabbit assist you with on this fine day? e to exit <--" output_Choice

if [[ ${output_Choice} == "e" ]]; then
	echo "Exiting script, hope this was helpful :)"
	exit 0
fi

echo " "

case ${output_Choice} in

	1)
		echo -e "basic loop\n"
		echo -e "for i in x; do\n\techo \$i\ndone"
	;;
	2)
		echo -e "c-like loop\n"
		echo -e "for ((i = 0 ; i < 10 ; i++)); do\n\techo \$i\ndone"
	;;
	3)
		echo -e "ranged loops\n"
		echo -e "for i in {5..10}; do\n\techo \"Stay a while and listen \$i\"\ndone\n"
		echo "With a step size of 3"
		echo -e "for i in {12..36..3}; do\n\techo \"Stay a while and listen \$i\"\ndone\n"
		echo "iterating an array"
		echo -e "for i in \"\${array_Name[@]}\"; do"
		echo "cmd \$i"
		echo "done"
	;;
	4)
		echo -e "line read loop\n"
		echo -e "cat file | while read line; do\n\t echo \$line"
		echo "done"
	;;
	5)
		echo -e "while loop\n"
		echo -e "while [[ \"\$A\" == \"\$B\" ]]; do\n\t {perform an action}\ndone"
	;;
	6)
		echo -e "conditionals\n"
		echo -e "if [[ -flag \"\$variable\" ]]; then"
		echo -e "\t cmd \"do a thing\""
		echo -e "elif [[ -anotherflag \"\$variable\" ]]; then"
		echo -e "\t cmd \"do a thing\""
		echo "fi"
		
		echo -e "[[ is a command that returns a boolean value"
		echo -e "[ and [[ perform a similar function but [[ should be prefered "
		echo -e "[[ -z STRING ]]\t\t # Empty string"
		echo -e "[[ -n STRING ]]\t\t # Not empty string"
		echo -e "[[ STRING == STRING ]]\t # Equal"
		echo -e "[[ STRING != STRING ]]\t # Not Equal"
		echo -e "[[ NUM -eq NUM ]]\t\t # Equal"
		echo -e "[[ NUM -ne NUM ]]\t\t # Not equal"
		echo -e "[[ NUM -lt NUM ]]\t\t # Less than"
		echo -e "[[ NUM -le NUM ]]\t\t # Less than or equal"
		echo -e "[[ NUM -gt NUM ]]\t\t # Greater than"
		echo -e "[[ NUM -ge NUM ]]\t\t # Greater than or equal"
		echo -e "[[ STRING =~ STRING ]]\t # Regexp"
		echo -e "(( NUM < NUM ))\t\t # Numeric conditions"
		echo -e "[[ -o noclobber ]]\t\t # If OPTIONNAME is enabled"
		echo -e "[[ ! EXPR ]]\t\t # Not"
		echo -e "[[ X && Y ]]\t\t # And"
		echo -e "[[ X || Y ]]\t\t # Or"
	;;
	7)
		echo -e "basic function syntax\n"
		echo "do_A_Thing() {"
		echo -e "\tdoing a thing"
		echo "}"
		echo -e "cmd \$(do_A_Thing)\n"
		
		echo -e "passing values into function, \"function\" can be used to declare a function but not needed\n"
		echo "function do_A_Thing() {"
		echo -e "cmd \"do a thing with \$1\""
		echo "}"
		echo -e "do_A_Thing \"value\""
	;;
	8)
		echo -e "brace expansion\n"
		echo "for all files in array/list from A to C, (A.ext B.ext, C.ext)\n"
		echo "cmd {A,C}.ext\n"
		echo "for all numbers in range of 15 to 20\n"
		echo "{15..20}\n"
		echo "for brace expansion with variable step size\n"
		echo "{50..200..25}\n"
		echo "same as 50 75 100 125 150 175 200\n"
	;;
	9)
		echo -e "arguments\n"
		echo -e "\$#\t# number of arguments"
		echo -e "\$*\t# all arguments"
		echo -e "\$@\t# all arguments from first"
		echo -e "\$(number)\t# 1st, 2nd, 3rd etc argument"
		echo -e "\$_\t# last argument of previous cmd"
	;;
	10)
		echo -e "file conditionals\n"
		echo -e "[[ -e FILE ]]\t\t # Exists?"
		echo -e "[[ -r FILE ]]\t\t # Readable?"
		echo -e "[[ -h FILE ]]\t\t # Symlink?"
		echo -e "[[ -d FILE ]]\t\t # Directory?"
		echo -e "[[ -w FILE ]]\t\t # Writable?"
		echo -e "[[ -s FILE ]]\t\t # Size is > 0 bytes?"
		echo -e "[[ -f FILE ]]\t\t # is a File?"
		echo -e "[[ -x FILE ]]\t\t # Executable?"
		echo -e "[[ FILE1 -nt FILE2 ]]\t # 1 is more recent than 2?"
		echo -e "[[ FILE1 -ot FILE2 ]]\t # 2 is more recent than 1?"
		echo -e "[[ FILE1 -ef FILE2 ]]\t # Same files?"
	;;
	11)
		echo -e "defining arrays\n"
		echo "array_Name=(value_1, value_2, value_3)"
		echo "or this can be performed by"
		echo -e "array_Name=\"value_1\""
		echo -e "array_Name=\"value_2\""
		echo -e "array_Name=\"value_3\""
	;;
	12)
		echo -e "working on arrays\n"
		echo -e "cmd \${array_Name[3]}\t# 3rd element"
		echo -e "cmd \${array_Name[-2]}\t# 2nd from last element"
		echo -e "cmd \${array_Name[@]}\t# all elements space seperation"
		echo -e "cmd \${#array_Name[@]}\t# numbers of elements"
		echo -e "cmd \${#array_Name}\t# string length of 1st element"
		echo -e "cmd \${#array_Name[n]}\t# string length of nth element"
		echo -e "cmd \${array_Name[@]:p:l}\t# range from position p to length l"
		echo -e "cmd \${!array_Name[@]}\t# key of all elements space seperated"
	;;
	13)
		echo -e "array operations\n"
		echo "I need to work on array operations more before i make note of them"
	;;
	14)
		echo -e "defining dictionaries\n"
		echo "aka associative arrays, hence -A\n"
		echo "declare -A genre"
		echo -e "genre[AngelMaker]=\"Deathcore\""
		echo -e "genre[Metallica]=\"Metal\""
		echo -e "genre[LambofGod]=\"Groove Metal\""
	;;
	15)
		echo -e "working on dictionaries\n"
		echo -e "\${genre[AngelMaker]}\t # value at "
		echo -e "\${genre[@]}\t # all values"
		echo -e "\${!genre[@]}\t # all keys"
		echo -e "\${#genre[@]}\t # number of elements"
		echo -e "unset genre[Metallica]\t # delete Metallica"
	;;
	16)
		echo -e "dictionary iteration\n"
		echo "need to check if val actually has to be val, and also key"
		echo -e "for val in \"\${genre[@]}\"; do"
		echo -e "\tcmd \$val"
		echo "done"
		echo "iteration over keys"
		echo -e "for key in \"\${!genre[@]}\"; do"
		echo -e "\tcmd \$key"
		echo "done"
	;;
	17)
		echo -e "options\n"
		echo -e "set -o noclobber\t# Avoid overlay files (echo \"hi\" > foo)"
		echo -e "set -o errexit\t# Used to exit upon error, avoiding cascading errors"
		echo -e "set -o pipefail\t# Unveils hidden failures"
		echo -e "set -o nounset\t# Exposes unset variables"
	;;
	18)
		echo -e "glob options\n"
		echo "need to play with these, for more understanding"
		echo -e "shopt -s nullglob\t # Non-matching globs are removed  (\'*.foo' => \'\')"
		echo -e "shopt -s failglob\t # Non-matching globs throw errors"
		echo -e "shopt -s nocaseglob\t # Case insensitive globs"
		echo -e "shopt -s dotglob\t # Wildcards match dotfiles (\"*.sh\" => \".foo.sh\")"
		echo -e "shopt -s globstar\t # Allow ** for recursive matches (\'lib/**/*.rb' => \'lib/a/b/c.rb\')"
		echo -e "Set GLOBIGNORE as a colon-separated list of patterns to be removed from glob matches."
	
	;;
	19)
		echo -e "history commands\n"
		echo -e "history\t #Show history"
		echo -e "shopt -s histverify\t #Don\’t execute expanded result immediately"
	;;
	20)
		echo -e "history expansions\n"
		echo -e "!$\t #Expand last parameter of most recent command"
		echo -e "!*\t #Expand all parameters of most recent command"
		echo -e "!-n\t #Expand nth most recent command"
		echo -e "!n\t #Expand nth command in history"
		echo -e "!cmd\t #Expand most recent invocation of command <command>"
	;;
	21)
		echo -e "history operations\n"
		echo -e "!!\t #Execute last command again"
		echo -e "!!:s/<FROM>/<TO>/\t #Replace first occurrence of <FROM> to <TO> in most recent command"
		echo -e "!!:gs/<FROM>/<TO>/\t #Replace all occurrences of <FROM> to <TO> in most recent command"
		echo -e "!$:t\t #Expand only basename from last parameter of most recent command"
		echo -e "!$:h\t #Expand only directory from last parameter of most recent command"
	;;
	22)
		echo -e "history slices\n"
		echo -e "!!:n\t #Expand only nth token from most recent command (command is 0; first argument is 1)"
		echo -e "!^\t #Expand first argument from most recent command"
		echo -e "!$\t #Expand last token from most recent command"
		echo -e "!!:n-m\t #Expand range of tokens from most recent command"
		echo -e "!!:n-$\t #Expand nth token to last from most recent command"
	;;
	23)
		echo -e "subshells\n"
		echo -e "(cd somedir; echo \"I\'m now in \$PWD\")"
		echo -e "pwd\t # still in first directory"
		
	;;
	24)
		echo -e "isnpect a command\n"
		echo -e "command -V cmd"
	;;
	25)
		echo -e "random number\n"
		echo -e "\$((\$RANDOM%100))\t # Random number 0..99"
	;;
	26)
		echo -e "arithemtic\n"
		echo -e "\$((x + 100))\t #add 100 to \$x"
		echo -e "\$((x - 100))\t #subtract 100 from \$x"
		echo -e "\$((x * 100))\t #multiply \$x by 100"
		echo -e "\$((x / 100))\t #divide \$x by 100"
		echo -e "\$((x % 2))\t #modulus \$x by 2 need to check if modulus in bash has sign of dividend"
		echo -e "\$((x ++ 100))\t #post increment \$x by 100"
		echo -e "\$((x -- 100))\t #post decrement \$x by 100"
		echo -e "\$((x ** 100))\t #exponentiate \$x by 100"
	;;
	27)
		echo -e "getting options\n"
		echo -e "while [[ \"\$1\" =~ ^- && ! \"\$1\" == \"--\" ]]; do case \$1 in"
		echo -e "\t-V | --version \)"
		echo -e "\t\techo \$version"
		echo -e "\t\texit"
		echo -e "\t\t;;"
		echo -e "\t-s | --string )"
		echo -e "\t\tshift; string=\$1"
		echo -e "\t\t;;"
		echo -e "\t-f | --flag )"
		echo -e "\t\tflag=1"
		echo -e "\t\t;;"
		echo -e "esac; shift; done"
		echo -e "if [[ \"\$1\" == \'--\' ]]; then shift; fi"
	;;
	28)
		echo -e "redirection\n"
		echo -e ""
		echo -e "cmd variable > output.txt\t\t# stdout to (file)"
		echo -e "cmd variable >> output.txt\t\t# stdout to (file), append"
		echo -e "cmd variable 2> error.log\t\t# stderr to (file)"
		echo -e "cmd variable 2>&1\t\t# stderr to stdout"
		echo -e "cmd variable 2>/dev/null\t\t# stderr to (null)"
		echo -e "cmd variable &>/dev/null\t\t# stdout and stderr to (null)\n"
		echo -e "cmd script < file.ext\t\t# feed file.ext to stdin for script/cmd"
	;;
	29)
		echo -e "trap errors\n"
		echo -e "trap \'echo Error at about \$LINENO\' ERR"
		echo "or"
		echo -e "traperr() {"
		echo -e "\techo \"ERROR: \${BASH_SOURCE[1]} at about \${BASH_LINENO[0]}\""
		echo -e "}\n"
		echo -e "set -o errtrace"
		echo -e "\trap traperr ERR"
	;;
	30)
		echo -e "\case/switch\n"
		echo -e "string"
		echo -e "case \$string in"
		echo -e "\tstring1)\t #case 1"
		echo -e "\t\tcmd string"
		echo -e ";;"
		echo -e "\tstring2)\t #case 2"
		echo -e "\t\tcmd string"
		echo -e ";;"
		echo -e "\t*)\t #default case"
		echo -e "\t\tcmd string"
		echo -e "\t;;"
		echo -e "esac\n"
		echo -e "numerical"
		echo -e "case \$variable in"
		echo -e "\t1)\t #case 1"
		echo -e "\t\tcmd variable"
		echo -e ";;"
		echo -e "\t2)\t #case 2"
		echo -e "\t\tcmd variable"
		echo -e ";;"
		echo -e "\t*)\t #default case"
		echo -e "\t\tcmd variable"
		echo -e "\t;;"
		echo -e "esac"
	;;
	31)
		echo -e "special variables\n"
		echo -e "\$?\t # Exit status of last task"
		echo -e "\$!\t # PID of last background task"
		echo -e "\$$\t #PID of shell"
		echo -e "\$0\t #Filename of the shell script"
	;;
	32)
		echo -e "check cmd result\n"
		echo -e "if ping -c 1 google.com; then"
		echo -e "\techo \"It appears you have a working internet connection\""
		echo -e "fi"
	;;
	33)
		echo -e "grep check\n"
		echo -e "if grep -q \'foo\' ~/.bash_history; then"
		echo -e "\techo \"You appear to have typed \'foo\' in the past\""
		echo -e "fi"
	;;
	*)
		echo "Exiting Script because I have no clue what you typed o.O"
		exit 1
	;;
esac

done
