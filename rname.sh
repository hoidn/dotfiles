#!/bin/bash

for file in `ls | sort -g -r | grep -e '[0-9]\\+$'`
do
    echo $file
    filename=$(basename "$file")
    extension=${filename##*.}
    filename=${filename%.*}

    mv "$file" "$filename.$(($extension + 1))"
done
