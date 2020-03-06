#!/bin/bash

#*******************************************************************************

INPUT1=$1 # file string name 1

touch /home/bread/bin/$1.sh

chmod 700 /home/bread/bin/$1.sh

echo "#!/bin/bash" > /home/bread/bin/$1.sh

echo "" >> /home/bread/bin/$1.sh

echo "#*******************************************************************************" \
>> /home/bread/bin/$1.sh
echo -e "#  (\_/)\n#  (*.*) Hello!\n# (\")_(\")" >> /home/bread/bin/$1.sh
echo "#*******************************************************************************" \
>> /home/bread/bin/$1.sh

nano /home/bread/bin/$1.sh
