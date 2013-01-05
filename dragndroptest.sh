#!/bin/bash
# After running the .bat file you can use this script to verify that everything
# is working correctly. Just double-click it in the Windows Explorer or drop
# some folders and/or files onto it.
echo "You are running this script:"
echo "$0"
var_counter=1
while [ ! "$1" == "" ]
do
	echo -e "\nArgument #${var_counter}:"
	echo "$1"
	let var_counter="$var_counter"+1
	shift
done
echo ""
read -p "Enter to exit."
