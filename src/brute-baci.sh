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
	echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m"$(bainterp $PCO_NAME)
	sleep .5
	i=$[i+1]
done


