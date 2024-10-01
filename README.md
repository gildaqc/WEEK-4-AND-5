# WEEK 4-5
## Problem 1: Count the number of amino acids in the encoded peptide and bases contained in the ORF of the DNA sequence encoding given an amino acid sequence ( KVRMFTSELDIMLSVNGPADQIKYFCRHWT*)

```bash
mkdir Week5
nano calculate_peptide.py
python calculate_peptide.py
git init
git add calculate_peptide.py
git commit -m "Solve problem 1"
git push -u origin main
```
OUPUT: 
```bash
Number of amino acids (not including stop codon): 30
Total bases in the ORF (including stop codon): 93
```
SUBMITTED FILES: calculate_peptide.py

## Problem 2: Running Prodigal on a genome to count number of genes
```bash
# Load Prodigal
module load prodigal
# Run Prodigal to annotate genes
prodigal -i ecoli.fna -o ecoli.gbk -d ecoli_genes.fna
# Count the number of annotated genes and save it to gene_count.txt
grep ">" ecoli_genes.fna -c > gene_count.txt
```
SUBMITTED FILES: gene_count.txt (4161)

## Problem 3: Script to run Prodigal on all downloaded genomes

All files are in: /home/quezadgc/ncbi_dataset/data/

```bash
module load prokka
nano run_Prodigal.sh
chmod +x run_Prodigal.sh # Add executable permissions to the file
sbatch run_Prodigal.sh 
git add prodigal_results.txt all_genome_counts_prodigal.txt
git commit -m "Saving Problem 3 output files"
```
OUTPUT: Genome with the highest number of genes: GCA_000006745.1 with 3594 genes 

SUBMITTED FILES: run_Prodigal.sh  and  prodigal_results.txt  and  all_genome_counts_prodigal.txt

## Problem 4: Script to run Prokka on all downloaded genomes
```bash
module load prokka
nano run_prokka.sh 
chmod +x run_prokka.sh
sbatch run_prokka.sh
cd prokka_output
git add cds_counts.txt
git commit -m "Saving output file probem 4"
```
SUBMITTED FILES: run_prokka.sh and cds_counts.txt

### Discussion: Are the total number of genes the same as they were with prodigal? What are the differences?
#### Total Counts
- Prodigal predicted between **897 to 3594** genes across the genomes.
- Prokka annotated between **892 to 3589** coding sequences (CDS), showing a slightly lower count.

#### Differences

Prokka's counts are generally lower than Prodigal's because Prodigal includes potential genes, which may encompass false positives. In contrast, Prokka focuses on actual coding sequences, resulting in fewer annotations. For example, the genome **GCA_000008525.1** had **1579** genes predicted by Prodigal but only **1577** CDS annotated by Prokka.

## Problem 5: Extract and list all unique gene names annotated by Prokka using shell commands

``` bash
cd prokka_output/
grep -h "ID=" */*.gff | sed 's/.*ID=//; s/;.*//' | sort -u > unique_gene_names.txt
head -n 5 unique_gene_names.txt
git add unique_gene_names.txt
git commit -m "Saving the output file of problem 5"
```
OUTPUT:
``` bash
AFMNAGNA_00001
AFMNAGNA_00002
AFMNAGNA_00003
AFMNAGNA_00004
AFMNAGNA_00005
```
SUBMITTED FILES: unique_gene_names.txt
