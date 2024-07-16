#!/bin/bash

# Loop through lines of motif list file
while read line
do
    # Search for number of occurrences of motif in genome file by printing out each match on a new line then counting the number of lines
    number=`grep -o $line sample_genome.txt | wc -l`
    # Print out results
    echo Number of occurences of $line: $number
    # Add results to motif_count.txt
    #echo Number of occurences of $line: $number >> motif_count.txt
    # Write each gene with a match to FASTA file
    fileName=$line.txt
done < motif_list.txt # Motif list file is the input rather than input from user