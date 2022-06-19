#!/bin/bash

if [ -z "$1" ]
then
    echo "Missing Input Parameter" 1>&2
    exit 64
fi

dateStamp=$(date +%F--%H-%M-%S)

filename=$dateStamp.flac

ffmpeg -f alsa -ar 48000 -ac 1 -i hw:1 -t $1 $filename

gsutil cp $filename gs://brbc_files

mv -v $filename backup
