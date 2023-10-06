#!/bin/bash

white_text='\033[97m'
red_text='\033[91m'
green_text='\033[92m'
blue_text='\033[34m'
purple_text='\033[35m'
black_text='\033[30m'
default_text='\033[39m'

white_background='\033[107m'
red_background='\033[101m'
green_background='\033[102m'
blue_background='\033[44m'
purple_background='\033[45m'
black_background='\033[40m'
default_backgrount='\033[49m'

case $2 in
	1) text_2=$white_text;;
	2) text_2=$red_text;;
	3) text_2=$green_text;;
	4) text_2=$blue_text;;
	5) text_2=$purple_text;;
	6) text_2=$black_text;;
	*) text_2=$default_text;;
esac

case $4 in
	1) text_4=$white_text;;
	2) text_4=$red_text;;
	3) text_4=$green_text;;
	4) text_4=$blue_text;;
	5) text_4=$purple_text;;
	6) text_4=$black_text;;
	*) text_4=$default_text;;
esac

case $1 in
	1) back_1=$white_background;;
	2) back_1=$red_background;;
	3) back_1=$green_background;;
	4) back_1=$blue_background;;
	5) back_1=$purple_background;;
	6) back_1=$black_background;;
	*) back_1=$default_background;; 
esac

case $3 in
	1) back_3=$white_background;;
	2) back_3=$red_background;;
	3) back_3=$green_background;;
	4) back_3=$blue_background;;
	5) back_3=$purple_background;;
	6) back_3=$black_background;;
	*) back_3=$default_background;;
esac

sh information.sh $back_1 $text_2 $back_3 $text_4
