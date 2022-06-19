#!/bin/bash

howFull=`df -H | grep -E 'mmcblk0p2' | awk '{ print $5 }' | tr % " "`

if [ "$howFull" -ge "80" ]
then
	filesInDir=`find ./backup -maxdepth 1 -type f -mtime +30`

	for t in ${filesInDir[@]}; do
  		rm -v $t
	done
fi

#Check a second time, if it's still over the treshhold delete everything older then a day.
howFull=`df -H | grep -E 'mmcblk0p2' | awk '{ print $5 }' | tr % " "`

if [ "$howFull" -ge "80" ]
then
        filesInDir=`find ./backup -maxdepth 1 -type f -mtime +1`

        for t in ${filesInDir[@]}; do
                rm -v $t
        done
fi
