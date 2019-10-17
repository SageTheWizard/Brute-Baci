#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Enter your .pco file name as a command line argument"
	exit 1
fi

i=0
while [ $i -lt 10000 ]
do
	echo -e "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m"$(bainterp $1)
	sleep .5
	i=$[i+1]
done


