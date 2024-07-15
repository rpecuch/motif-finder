#!/bin/bash

# Loop through lines of motif list file
while read line
do
    echo Number of occurences of $line: number
done < motif_list.txt # Motif list file is the input rather than input from user