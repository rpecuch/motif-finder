#!/bin/bash

# Create output directory if does not exist
mkdir -p motifs/

# Loop through lines of motif list file
while read line
do
    # Search for number of occurrences of motif in FASTA file by printing out each match on a new line then counting the number of lines
    number=`grep -o $line r_bifella.fasta | wc -l`
    # Print out results
    echo "Number of occurences of $line: $number"
    # Add results to motif_count.txt
    # echo $line $number >> motif_count.txt

    # Output file name
    fileName=motifs/$line.txt
    # Loop through lines of FASTA file to get content for output file
    content=`cat r_bifella.fasta`
    # Change separator to > character
    IFS='>'
    for gene in $content
    do
        # Count number of matches in gene
        match_count=`grep -c $line <<< $gene`

        if [ $match_count -gt 0 ]
        then
            # Write gene name to output file (derive by removing all nucleotides from string)
            # TODO: try to clean this up so spacing is even
            echo $gene | tr -d ATCG >> $fileName
            
            # Write sequences with matches to output file
            echo $gene | grep -E -o ".{0,3}$line.{0,3}" >> $fileName

            # Add whitespace for readability
            echo "" >> $fileName
        fi
    done

done < interesting_motifs.txt # Motif list file is the input rather than input from user