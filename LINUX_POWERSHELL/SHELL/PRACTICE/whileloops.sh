#!/bin/bash

#exercise1
LINE_NUM=1
while read LINE
do
  echo "${LINE_NUM}: ${LINE}"
  ((LINE_NUM++))
done < /etc/passwd

#exercise2
read -p "How many lines of /etc/passwd would you like to see? " SHOW_LINES

LINE_NUM=1
while read LINE
do
 if [ "$LINE_NUM" -gt "$SHOW_LINES" ]
 then
   break
 fi
 echo $LINE
 ((LINE_NUM++))
done < /etc/passwd

#exercise3
while true
do
  echo "1. Show disk usage."
  echo "2. Show system uptime."
  echo "3. Show the users logged into the system."
  read -p "What would you like to do? (Enter q to quit.) " CHOICE

  case "$CHOICE" in
    1)
      df
      ;;
    2)
      uptime
      ;;
    3)
      who
      ;;
    q)
      break
      ;;
    *)
      echo "Invalid option."
      ;;
  esac
  echo
done
echo "Goodbye!"
