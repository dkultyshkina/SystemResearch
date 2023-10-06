#!/bin/bash

while read data
do		

	if [[ $data == *"column1_background"* ]]
	then first=$(echo $data | cut -d "=" -f 2)
	fi
	if [[ $data == *"column1_font_color"* ]]
	then second=$(echo $data | cut -d "=" -f 2)
	fi
	if [[ $data == *"column2_background"* ]]
	then third=$(echo $data | cut -d "=" -f 2)
	fi
	if [[ $data == *"column2_font_color"* ]]
	then fourth=$(echo $data | cut -d "=" -f 2)
	fi
done < config

./check.sh $first $second $third $fourth 
