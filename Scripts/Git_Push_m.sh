#*******************************************************************************
# (\_/)   Author: Bradley Stradling
# (o.o)   Date of first revision: 3/9/20 (Refactoring ongoing)
#(")_(")  Lincense: https://unlicense.org/
#*******************************************************************************
# (\_/)   Takes a comment for a new commit runs git add .
# (*.*)   Adds commit for master branch with comment
#(")_(")  Runs git push.   This must be run in the repo to work. Any repo. 
#*******************************************************************************

read -p "Please enter a comment for this commit -->" comment

git add .

git commit -m "${comment}"

git push

# Haha if you thought I would put my login in a script...
# Don't do that...
