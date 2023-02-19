#!/bin/bash

#exercise1
echo "This script will exit with a 0 exit status."
exit 0

#exercise2
file = $1
if [-f "$file"]
then 
	echo "$FILE is a regular file."
	exit 0
elif [-d "$file"]
then
	echo "$FILE is a directory."
	exit 1
else
	echo "$FILE is something other than a regular file or directory."
	exit 2
fi

#exercise3
cat /etc/shadow
if ["$?" -eq "0"]
then 
	echo "Command succeeded"
	exit 0
else
	echo "Command failed"
	exit 1
fi
