#!/bin/bash

# Create output directory if does not exist
mkdir -p motifs/

# Define variables available to script
motifs_to_search=`cat $1`
input_genome=$2

# Loop through lines of motif list file
for line in $motifs_to_search
do
    # Search for number of occurrences of motif in FASTA file by printing out each match on a new line then counting the number of lines
    number=`grep -o $line ./$input_genome | wc -l`

    # Print out results
    echo "Number of occurences of $line: $number"

    # Add results to motif_count.txt
    echo $line $number >> motif_count.txt

    # # Define output file name
    fileName=motifs/$line.txt

    # Write out all matching sequences to output file, include gene name by printing out the line before each sequence with match(es)
    grep -B1 $line ./$input_genome >> $fileName

done 