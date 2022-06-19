#!/bin/bash

for filename in {1..200}
do
	SIZE=$((0+RANDOM%3))      
	echo "filename = $filename.txt"
	touch -d "2012-10-19 12:12:12.000000000 +0530" $filename.txt
done
