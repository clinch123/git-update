#!/bin/bash

echo "Checking if program is running with sudo privileges..."
#check if running as root
if [ "$EUID" -ne 0 ]
  then echo "Please run with sudo access."
  exit
fi
echo "Program is running with sudo privileges." 

echo "Checking if git-update.sh has been downloaded"
#Check if git-update.sh exists in /opt/git-update
if [ ! -f /opt/git-update/git-update.sh ]; then
  echo "File not found. Downloading script"
  if [ ! -d /opt/git-update/ ]; then
    mkdir /opt/git-update/
  fi
  cd /opt/git-update
  sudo git clone https://github.com/clinch123/git-update.git
else

fi

#Check if git-update.sh is executable

#Check if ln exists between /opt/git-update/git-update.sh and /usr/local/bin/git-update
