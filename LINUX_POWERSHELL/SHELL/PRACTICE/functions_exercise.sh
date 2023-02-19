#!/bin/bash


#exercise1
function file_count(){
	local NUMBER_OF_FILES=$(ls | wc -l)
   echo "$NUMBER_OF_FILES"
}

file_count

#exercise2
function file_counts(){
	local dir=$1
   local NUMBER_OF_FILES=$(ls $dir | wc -l)
   echo "{$dir}:"
   echo "$NUMBER_OF_FILES"
   }
   
file_counts /etc
file_counts /var
file_counts /usr/bin
