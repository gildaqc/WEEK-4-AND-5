#!/bin/bash
#SBATCH--job-name=ash_script
#SBATCH--output=ash.out
#SBATCH--error=ash.err
#SBATCH--time=1:00:00

OUTPUT_FILE="/home/quezadgc/Week5/output_PRODIGAL.fna"
RESULTS_FILE="/home/quezadgc/Week5/prodigal_results.txt"
ALL_COUNTS_FILE="/home/quezadgc/Week5/all_genome_counts_prodigal.txt"

MAX_GENES=0
MAX_GENOME=""

for genome in $(find /home/quezadgc/ncbi_dataset/data/  -type f -name "*GCA*.fna"); do

    prodigal -i "$genome" -d "$OUTPUT_FILE" # runs Prodigal to predict genes from the input genome
    gene_count=$(grep ">" -c "$OUTPUT_FILE") # counts the number of annotated genes in the output file
    echo "$genome: $gene_count" >> "$ALL_COUNTS_FILE" # This appends the genome filename and its gene count to the ALL_COUNTS_FILE.

    # find the maximum. It checks if the current genome has more genes than the previous maximum and updates the maximum values accordingly.
    if [ "$gene_count" -gt "$MAX_GENES" ]; then 
        MAX_GENES=$gene_count
        MAX_GENOME=$genome
    fi
done

#Storing the result
result="Genome with the highest number of genes:
File: $MAX_GENOME
Number of genes: $MAX_GENES"

echo "$result"

echo "$result" > "$RESULTS_FILE"

rm "$OUTPUT_FILE"
