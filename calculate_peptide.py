# calculate_peptide.py

def main():
    # Given amino acid sequence
    amino_acid_sequence = "KVRMFTSELDIMLSVNG-PADQIKYFCRHWT*"

    # Remove the stop codon
    cleaned_sequence = amino_acid_sequence.replace("*", "")
    
    # Count the amino acids
    num_amino_acids = len(cleaned_sequence.replace("-", ""))  # Ignore any gaps (if present)
    
    # Calculate the total bases in the ORF (including the stop codon)
    total_bases = (num_amino_acids + 1) * 3  # +1 for the stop codon

    # Print the results
    print(f"Number of amino acids (not including stop codon): {num_amino_acids}")
    print(f"Total bases in the ORF (including stop codon): {total_bases}")

if __name__ == "__main__":
    main()
