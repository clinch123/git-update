#!/bin/bash

sudo git branch -a 

echo "Please enter the branch to update:"
	read branch

DATE=`date +%Y-%m-%d`
sudo git add .
sudo git commit -m "Update $DATE"
sudo git push origin $branch

