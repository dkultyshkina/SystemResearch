#!/bin/bash

echo "Would you like to write this information in file? If yes, please, enter Y/y"
read var
if [ "$var" != "${var#[Yy]}" ]
	then sh yes.sh
	else echo "your answer is no"
fi
exit 0

