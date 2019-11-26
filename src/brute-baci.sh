#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Enter your .cm file name as a command line argument"
	exit 1
fi

bacc $1
IFS='.' read -ra FILENAME <<< "$1"
PCO_NAME="${FILENAME[0]}.pco"

i=0
while [ $i -lt 1000000 ]
do
	output=$(bainterp $PCO_NAME)
	IFS='\n' read -r -a out_arr <<< $output
	for element in "${out_arr[@]}"
	do
		if [[ $output == *"Halt at"* ]]; then
			echo "DEADLOCK DETECTED"
			exit 1
		fi
	done
	echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m"$output
	sleep .5
	i=$[i+1]
done


