#!/bin/bash

# Load Prodigal module (if needed)
module load prodigal

# Initialize variables
max_genes=0
max_genome=""
output_file="gene_counts.txt"

# Clear the output file
echo -n > $output_file

# Loop through each directory in the data folder
for dir in /home/quezadgc/ncbi_dataset/data/*; do
    # Check if the directory contains a .fna file
    fna_file=$(find "$dir" -name "*.fna" | head -n 1)
    
    if [[ -f $fna_file ]]; then
        genome_name=$(basename "$dir")
        echo "Processing $genome_name..."

        # Run Prodigal
        prodigal -i "$fna_file" -o "$genome_name.gbk" -d "$genome_name_genes.fna"

        # Count the number of genes and append to the output file
        gene_count=$(grep ">" "$genome_name_genes.fna" -c)
        echo "$genome_name: $gene_count" >> $output_file
        
        # Check if this genome has the highest number of genes
        if (( gene_count > max_genes )); then
            max_genes=$gene_count
            max_genome=$genome_name
        fi
    fi
done

# Output the genome with the highest number of genes
echo "Genome with the highest number of genes: $max_genome with $max_genes genes"

