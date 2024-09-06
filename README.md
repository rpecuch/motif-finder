# Motif Finder
# Author: Rita Pecuch 

The goal of this Bash script is to identify the number of occurrences of each motif in an input genome and in which genes each motif is found in.

Input files: 
- r_bifella.fasta: input genome
- interesting_motifs.txt: list of motifs to search for

Output files: 
- motif_counts.txt: Lists the number of occurrences of each motif
- .txt file named after each motif in ./motifs directory: Lists all genes that motif is found in

Execution:

1) Copy over the following files into the directory that you would like to run the script:
- interesting_motifs.txt
- r_bifella.fasta
- motif_finder.sh

2) Execute the following command: bash motif_finder.sh interesting_motifs.txt r_bifella.fasta