#!/bin/bash

echo "Please enter the branch:"
	read branch

DATE=`date +%Y-%m-%d`
sudo git add .
sudo git commit -m "Update $DATE"
sudo git push origin $branch

