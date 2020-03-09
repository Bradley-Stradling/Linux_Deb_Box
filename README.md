# Linux_Deb_Box
Aliases and scripts for my linux bash set-up. 

Repo design to pull repo and run 1 script to set-up a box the way I want it in progress. End goal is a script that is easy to add new directories/files to with minimal effort yet robust output and creation.

Ideally pull repo, run Delpoy_Set-up.sh target the repo directory and have my common directories created with my common scripts imported, bashrc appended to add my newly created and imported scripts directory path. Import my aliases. And source the local paths to all the before mentioned for increased portability of my set-up and scripts.

Todo-
Test Deploy_setup script, lots of new code added to it. Now outputs to terminal what it is doing. Error checking has been added
but no stop or exit conditions exist. some exit conditions set, may add more, with more verbose error output to exit messages.

Make comments more verbose as to what each script and/or alias does within my set-up, and fix indentation where needed.

May move Deploy_Set-up.sh to a sub directory of it's own so it can have it's own source file of functions seperated from the main script.

Write script to add new resolution to xrandr, and set a source for the screenrez script to change to that resolution. (See useful links for guide.)

Todo later-
Add general functions file and source it to scripts along with paths.

Increase portability and flexibilty of script by sourcing a list file of directories to be created to the deploy set-up script, to further increase the ease of adding new directories to script. (depending on Deploy_Setup.sh ease of adding new directories this may not be needed.)
