#!/bin/bash

path=$1

if [ -d "$path" ]
	then ./information.sh $path $2
	else echo "Sorry, there is no such directory"
fi
	       	
