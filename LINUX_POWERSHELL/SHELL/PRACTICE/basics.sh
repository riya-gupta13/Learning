#!bin/bash

#exercise1
echo "Shell Scripting is Fun!"

#exercise2
var="Shell Scripting is Fun!"
echo "$var"

#exercise3
SERVER=$(hostname)
echo "This script is running on ${hostname}"

#exercise4
filename= "/etc/shadow"
if [-e "$filename"]
then 
	echo "Shadow passwords are enabled."
fi

if [-w "$filename"]
then 
	echo "You have permissions to edit /etc/shadow."
else
	echo "You do NOT have permissions to edit /etc/shadow."
fi

#exercise5
animals="man bear pig dog cat sheep"
for i in $animals
do
echo $i
done

#exercise6
read -p "Enter a file or directory name: " file
if [-f $file]
then
echo "It is a regular file."
elif [-d $file]
then
echo "It is a directory"
else
echo "Another type of file"
fi
ls -l $file


#exercise7
FILE=$1

if [ -f "$FILE" ]
then
  echo "$FILE is a regular file."
elif [ -d "$FILE" ]
then
  echo "$FILE is a directory."
else
  echo "$FILE is something other than a regular file or directory."
fi

ls -l $FILE

#exercise8
for FILE in $@
do
  if [ -f "$FILE" ]
  then
    echo "$FILE is a regular file."
  elif [ -d "$FILE" ]
  then
    echo "$FILE is a directory."
  else
    echo "$FILE is something other than a regular file or directory."
  fi

  ls -l $FILE
done














