# WEEK-4-AND-5
## Problem 1: Count number of amino acids and bases in ORF of the DNA sequence encoding the given amino acid sequence
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

## Problem 2: Running Prodigal on a genome to count number of genes
```bash
# Load Prodigal
module load prodigal
# Run Prodigal to annotate genes
prodigal -i ecoli.fna -o ecoli.gbk -d ecoli_genes.fna
# Count the number of annotated genes and save it to gene_count.txt
grep ">" ecoli_genes.fna -c > gene_count.txt
```
OUTPUT: File with the number of genes called "gene_count.txt"

## Problem 3: 

all files are in: /home/quezadgc/ncbi_dataset/data/

```bash
nano problem3.sh
chmod +x problem3.sh
./problem3.sh
git add problem3.sh
git commit -m "Solve problem 3"
```
OUTPUT: Genome with the highest number of genes: GCA_000006745.1 with 3594 genes

## Problem 4:
```bash
module load prokka
nano run_prokka.sh
chmod +x run_prokka.sh
sbatch run_prokka.sh
```
OUTPUT: "cds_counts.txt." (CDS counts saved to prokka_output/cds_counts.txt.)

### Discussion: Are the total number of
genes the same as they were with prodigal? What are the differences?
Total Counts:
Prodigal predicted between 897 to 3594 genes across the genomes.
Prokka annotated between 892 to 3589 CDS, showing a slightly lower count.
Differences:
Prokka's counts are generally lower than Prodigal's, as Prodigal includes potential genes, including false positives. Prokka focuses on actual coding sequences, resulting in fewer annotations.
For example, GCA_000008525.1 had 1579 genes predicted by Prodigal but only 1577 CDS by Prokka.
