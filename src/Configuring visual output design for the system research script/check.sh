#!/bin/bash

first=$1
second=$2
third=$3
fourth=$4
metka=0

if [ -n "$1" ]
	then first=$1	
        else first=0
fi

if [ -n "$2" ]
	then second=$2	
        else second=0
fi

if [ -n "$3" ]
	then third=$3	
        else third=0
fi

if [ -n "$4" ]
	then fourth=$4	
        else fourth=0
fi

if [ $first -gt 0 ] || [ $second -gt 0 ] || [ $third -gt 0 ] || [ $fourth -gt 0 ]
	then metka=1
fi	

if [[ $first =~ ^[0-6] ]] && [[ $second =~ ^[0-6] ]] && [[ $third =~ ^[0-6] ]] &&  [[ $fourth =~ ^[0-6] ]]
	then if [[ "$first" -ne "$second" ]] && [[ "$third" -ne "$fourth" ]] || [[ metka -eq 1  ]]
		then sh colors.sh $first $second $third $fourth
		else echo "You have entered the matching parameters"
	     fi
	else echo "Parameters are not numbers"
fi

