#!/bin/bash

echo

case $4 in
	1) text_2=white;;
	2) text_2=red;;
	3) text_2=green;;
	4) text_2=blue;;
	5) text_2=purple;;
	6) text_2=black;;
	0) text_2=white;;
esac

case $6 in
	1) text_4=white;;
	2) text_4=red;;
	3) text_4=green;;
	4) text_4=blue;;
	5) text_4=purple;;
	6) text_4=black;;
	0) text_4=blue;;
esac

case $3 in
	1) back_1=white;;
	2) back_1=red;;
	3) back_1=green;;
	4) back_1=blue;;
	5) back_1=purple;;
	6) back_1=black;;
	0) back_1=black;; 
esac

case $5 in
	1) back_3=white;;
	2) back_3=red;;
	3) back_3=green;;
	4) back_3=blue;;
	5) back_3=purple;;
	6) back_3=black;;
	0) back_3=red;;
esac

if [ $3 -ne 0 ]
	then first=$3	
        else first=default
fi

if [ $4 -ne 0 ]
	then second=$4	
        else second=default
fi

if [ $5 -ne 0 ]
	then third=$5	
        else third=default
fi

if [ $6 -ne 0 ]
	then fourth=$6	
        else fourth=default
fi

echo "Column 1 background = $first ($back_1)"
echo "Column 1 font color = $second ($text_2)"
echo "Column 2 background = $third ($back_3)"
echo "Column 2 font color = $fourth ($text_4)"
