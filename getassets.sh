#!/bin/sh

# Sync remote assets to a local directory
# ----------------------------------------------
#
# Useful for syncing images uploaded to a remote server to a local directory.
#
# Don’t forget chmod +x to make the script executable.
#
# Change the extension to .command to run the script directly from OS X Finder.
#

# Settings
# --------

# Set SSH host
# i.e. user@10.0.0.1
SSHHOST=''

# Set the remote directory for syncing down assets -- must be full path on server
SOURCEDIR=''

# Set the local directory to sync to -- must be full path like /Volumes/path/to/files
DESTDIR=''



# -------------------------------------
# YOU SHOULDN'T NEED TO GO ANY FURTHER!
# -------------------------------------



#//  $$\   $$\  $$$$$$\ $$\     $$\ $$\   $$\  $$$$$$\  $$\ $$\   $$\ 
#//  $$$\  $$ |$$  __$$\\$$\   $$  |$$$\  $$ |$$  __$$\ $  |$$$\  $$ |
#//  $$$$\ $$ |$$ /  \__|\$$\ $$  / $$$$\ $$ |$$ /  \__|\_/ $$$$\ $$ |
#//  $$ $$\$$ |\$$$$$$\   \$$$$  /  $$ $$\$$ |$$ |          $$ $$\$$ |
#//  $$ \$$$$ | \____$$\   \$$  /   $$ \$$$$ |$$ |          $$ \$$$$ |
#//  $$ |\$$$ |$$\   $$ |   $$ |    $$ |\$$$ |$$ |  $$\     $$ |\$$$ |
#//  $$ | \$$ |\$$$$$$  |   $$ |    $$ | \$$ |\$$$$$$  |    $$ | \$$ |
#//  \__|  \__| \______/    \__|    \__|  \__| \______/     \__|  \__|
#//                                                                   
#//                                                                   
#//                                                                   



# Get yo rsync on!
# ----------------

# Run script in current directory
cd "`dirname "$0"`"

# Check variables
# ----------------

if [[ -z $SSHHOST ]]; then
	echo "Enter the SSH host to connect to: "
	read SSHHOST
fi

if [[ -z $SOURCEDIR ]]; then
	echo "Enter the full path on the remote you would like to sync: "
	read SOURCEDIR
fi

if [[ -z $DESTDIR ]]; then
	echo "Enter the full local path you would like to sync to: "
	read DESTDIR
fi

if [[ -z $SSHHOST || -z $SOURCEDIR || -z $DESTDIR ]]; then
	echo "All parameters are required. Try again!"
	exit
fi

# rSYNC
rsync \
--progress \
-avhze \
ssh \
--exclude="*.bak" \
"$SSHHOST:$SOURCEDIR" \
"$DESTDIR" \

# Did it work?
echo "You are in NSYNC!"