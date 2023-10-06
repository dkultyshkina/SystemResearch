#!/bin/bash

START_TIME=$2

echo "Total number of folders (including all nested ones) = $(sudo find $1 -maxdepth 10 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size): "
IFS=$'\n'
result=$(sudo du -ah $1 | sort -n -r | head -n 5 | awk '{print $2,",", $1, "MB"}')
count=$(sudo du -ah $1 | sort -n -r | head -n 5 | awk '{print $2, $1, "MB"}' | wc -l)
i=0
for var in $result
	do
		(( i++ ))
		echo "$i - $var"
	done
echo "etc up to 5"
cd $1
echo "Total number of files = $(sudo tree -a | grep "files" | cut -d ',' -f 2 | cut -d ' ' -f 2)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(sudo find $1 -name "*.conf" | wc -l)"
echo "Text files = $(sudo find $1 -name "*.txt" | wc -l)"
echo "Executable files = $(sudo find $1 -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(sudo find $1 -name "*.log" | wc -l)"
echo "Archive files = $(sudo find $1 -name "*.tar" -o -name "*.zip" -o -name "*.gz" -o -name "*.rar" -o -name "*.7z" | wc -l)"
echo "Symbolic links = $(sudo find $1 -type l | wc -l)"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
IFS=$'\n'
result=$(sudo find $1 -type f -exec du -ah {} ';' | sort -n -r | head -n 10 | awk '{print $2, ",", $1 }')
count=$(sudo find $1 -type f -exec du -ah {} ';' | sort -n -r | head -n 10 | wc -l)
i=0
for var in $result
	do
		(( i++ ))
		filename=$(echo $var | cut -d "," -f 1 | cut -d " " -f 1)
		echo "$i - $var, $(file $filename)"
	done
echo "etc up to 10"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
IFS=$'\n'
result=$(sudo find $1 -type f -executable -exec du -ah {} ';' | sort -n -r | head -n 10 | awk '{print $2, ",", $1 }' )
count=$(sudo find $1 -type f -executable -exec du -ah {} ';' | sort -n -r | head -n 10 | awk '{print $2, ","}')
i=0
for var in $result
	do
		(( i++ ))
		filename=$( echo $var | cut -d "," -f 1 | cut -d " " -f 1)
		echo $filename
		echo "$i - $var, $(md5sum $filename | awk '{print $1}')"	
	done
echo "etc up to 10"
END_TIME=$(date +%s)
difference=$(( $END_TIME-$START_TIME ))
echo "Srcipt execution time (in seconds) = $difference"
