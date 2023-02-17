#!/bin/bash


#exercise1

# YYYY-MM-DD
DATE=$(date +%F)
for FILE in /var/www/*.jpg
	do
	echo "Copying $FILE"
	mv $FILE ${DATE}-${FILE}
done


#exercise2

DATE=$(date +%F)

read -p "Enter a file extension: " extension
read -p "What prefix to prepend to the file name(s): " prefix
if [ -z "$prefix" ]
then
  prefix="$DATE"
fi

for FILE in *.${extension}
do
  NEW_FILE="${prefix}-${FILE}"
  echo "Renaming $FILE to ${NEW_FILE}."
  mv $FILE ${NEW_FILE}
done
 





