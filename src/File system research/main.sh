#!/bin/bash

START_TIME=$(date +%s)
count_separator=0
count_element=0

function ReadArray {
array=$1
echo $array
for i in "${array[@]}"; do
       if [[ $i != / ]]
       then (( count_element++ ))
       fi
done
return $count_element
}

if [ -n $1 ]
	then echo $1
	else exit 0	
fi

count_separator=$(echo $1 | grep -o "/" | wc -l)
IFS='/' read -a array <<< $1
ReadArray ${array}
count_element=$?

if [[ $count_separator -eq $count_element ]]
	then ./pwd.sh  $1 $START_TIME
	else echo "The specified path is not a directory"
fi
