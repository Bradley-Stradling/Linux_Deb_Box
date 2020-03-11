# Linux_Deb_Box
Aliases and scripts for my linux bash set-up imported and exported via Deploy_Setup and Pack_Up_Setup.

Script list: # needs to be added with short description of what they do.

Repo design to pull repo and run 1 script to set-up a box the way I want it in progress. End goal is a script that is easy to add new directories/files to with minimal effort yet robust output and creation. As well as a script to pack up the new alises/scripts/changes to scripts added in the local user account to the local copy of this repo and remove the source path lines from them.

Ideally pull repo, run Delpoy_Set-up.sh target the repo directory and have my common directories created with my common scripts imported, bashrc appended to add my newly created and imported scripts directory path. Import my aliases. And source the local paths to all the before mentioned for increased portability of my set-up and scripts across new systems and accounts.

Todo-
Work on getting Pack_Up_Setup flushed out and tested. needs to cleanse lines with source from aliases and scripts.

Write script to add new resolution to xrandr, and set a source for the screenrez script to change to that resolution. (See useful links for guide.)

Testing script changes 3/10/20

Add_Alias is good to go. 
Back_Me_Up is good to go.
Change_Work is good to go.

Deploy_setup is working correctly but has error in output confirmation of file check.
