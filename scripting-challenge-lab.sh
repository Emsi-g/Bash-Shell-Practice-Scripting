#!/bin/bash
# Challenge Lab: Bash SHell Scripting Exercise
# Creates 25 empty (0 KB) files. (Hint: Use the touch command.)
# The file names should be <yourName><number>, <yourName><number+1>, <yourName><number+2>, and so on.
# Design the script so that each time you run it, it creates the next batch of 25 files with increasing numbers starting with the last or maximum number that already exists.
# Do not hard code these numbers. You need to generate them by using automation.

NAME="File"
NUM=1
MAX=25
MIN=0
while true
do
	# Find the file in current directory
	if [[ -f "$(pwd)/$NAME$NUM" ]]; then
	((NUM++))
	else
		while [ $MIN -le $MAX ]
			do
			touch $NAME$NUM
			((MIN++))
			((NUM++))
			done
			break
	fi
done
echo "Created 25 files"