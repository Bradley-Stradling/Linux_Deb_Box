#!/bin/bash

#*******************************************************************************

INPUT1=$1 # file string name 1

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
