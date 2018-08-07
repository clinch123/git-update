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
  if [ ! -f /opt/git-update/git-update.sh ]; then
    echo "Unable to download git-update.sh. Please troubleshoot further"
    exit
  else
    echo "Git-Update downloaded. Continuing installation."
  fi
else
  echo "Git-update is correctly downloaded. Continuing installation."
fi

#Check if git-update.sh is executable
echo "Checking if git-update.sh is executeable."
if [ ! -x /opt/git-update/git-update.sh ]; then
  sudo chmod +x /opt/git-update/git-update.sh
  if [ ! -x /opt/git-update/git-update.sh ]; then
    echo "Unable to make file executeable. Please troubleshoot further"
    exit
  fi
  echo "git-update.sh is executable. Continuing..."
fi
  
#Check if ln exists between /opt/git-update/git-update.sh and /usr/local/bin/git-update
echo "Checking for symbolic link to /usr/local/bin"
if [ ! -L /usr/local/bin/git-update ]; then
  sudo ln -s /opt/git-update/git-update.sh /usr/local/bin
  if [ ! -L /usr/local/bin/git-update ]; then
    echo "Unable to link file. Please troubleshoot further"
    exit
  fi
  echo "git-update is linked. Finishing installation..."
fi

echo "Installation finished. Please use git-update command for any future requests"
