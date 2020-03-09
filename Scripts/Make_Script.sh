#!/bin/bash

#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/6/20
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Script to expedite the process of starting a new script. Will make
# (*.*)   the new script file write my rabbits comment header to the file
#(")_(")  and set permissions on the file.
#*******************************************************************************

# incomplete and untested as is !!!
# needs more verbosity of output of what script is doing.
# need to add output of author and date of first revision

INPUT1=$1 # name for new script

touch ${scripts_Path}/$1.sh

chmod 700 ${scripts_Path}/$1.sh

echo "#!/bin/bash" > ${scripts_Path}/$1.sh

echo "" >> ${scripts_Path}/$1.sh

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh

echo -e "#  (\_/)\tAuthor: Bradley Stradling\n#  (o.o) Hello!\tDate of first revision:\n# (\")_(\")\tLincense:" >> ${scripts_Path}/$1.sh

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh

echo -e "# (\_/)\t\n# (*.*)\t\n#(\")_(\")\t"

echo "#*******************************************************************************" >> ${scripts_Path}/$1.sh


nano ${scripts_Path}/$1.sh
