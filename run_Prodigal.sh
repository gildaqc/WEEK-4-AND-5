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
chmod +x .shchmod +x Prodigal_Problem3.sh
for genome in $(find /home/quezadgc/ncbi_dataset/data/  -type f -name "*GCA*.fna"); do

    prodigal -i "$genome" -d "$OUTPUT_FILE"
    gene_count=$(grep ">" -c "$OUTPUT_FILE")
    echo "$genome: $gene_count" >> "$ALL_COUNTS_FILE"

    if [ "$gene_count" -gt "$MAX_GENES" ]; then
        MAX_GENES=$gene_count
        MAX_GENOME=$genome
    fi
done

result="Genome with the highest number of genes:
File: $MAX_GENOME
Number of genes: $MAX_GENES"

echo "$result"

echo "$result" > "$RESULTS_FILE"

rm "$OUTPUT_FILE"
