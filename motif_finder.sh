#!/bin/bash

# Create output directory if does not exist
mkdir -p motifs/

# Loop through lines of motif list file
while read line
do
    # Search for number of occurrences of motif in FASTA file by printing out each match on a new line then counting the number of lines
    number=`grep -o $line r_bifella.fasta | wc -l`
    # Print out results
    echo Number of occurences of $line: $number
    # Add results to motif_count.txt
    #echo $line $number >> motif_count.txt

    fileName=motifs/$line.txt
    # Loop through lines of FASTA file to get content for output file
    while read gene_line
    do
        # Split line into an array containing gene name and nucleotide string
        IFS='>' read -a gene <<< $gene_line # String with line of file is the input
        gene_name=${gene[1]}
        gene_bases=${gene[0]}

        # TODO: figure out what is wrong with output
        # Write gene name and matches to output file
        echo $gene_name >> $fileName
        grep -E -o ".{0,5}$line.{0,5}" $gene_bases >> $fileName
    done < r_bifella.fasta  # FASTA file is the input

done < interesting_motifs.txt # Motif list file is the input rather than input from user