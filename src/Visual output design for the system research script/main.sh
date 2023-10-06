#!/bin/bash

if [ -n "$1" ] && [ -n "$2" ] && [ -n "$3" ] && [ -n "$4" ]
	then echo "All parameters are there"	
        else exit 0
fi

if [[ $1 =~ ^[1-6] ]] && [[ $2 =~ ^[1-6] ]] && [[ $3 =~ ^[1-6] ]] &&  [[ $4 =~ ^[1-6] ]]
	then if [[ "$1" -ne "$2" ]] && [[ "$3" -ne "$4" ]]
		then sh colors.sh $1 $2 $3 $4
		else echo "You have entered the matching parameters"
	     fi
	else echo "Parameters are not numbers"
fi

