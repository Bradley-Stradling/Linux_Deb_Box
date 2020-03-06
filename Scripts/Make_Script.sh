#!/bin/bash

#*******************************************************************************

# !!!incomplete and needs more testing!!!
INPUT1=$1 # file string name 1

touch /home/bread/bin/$1.sh

chmod 700 /home/bread/bin/$1.sh

echo "#!/bin/bash" > /home/bread/bin/$1.sh

echo "" >> /home/bread/bin/$1.sh

echo "#*******************************************************************************" >> /home/bread/bin/$1.sh

echo -e "#  (\_/)\tAuthor: Bradley Stradling\n#  (o.o) Hello!\tDate of first revision:\n# (\")_(\")\tLincense:" >> /home/bread/bin/$1.sh

echo "#*******************************************************************************" >> /home/bread/bin/$1.sh

echo -e " (\_/)\t\n (*.*)\t\n(\")_(\")\t"

echo "#*******************************************************************************" >> /home/bread/bin/$1.sh


nano /home/bread/bin/$1.sh
