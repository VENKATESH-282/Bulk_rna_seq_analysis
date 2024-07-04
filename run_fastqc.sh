#!/bin/bash

# Directory containing the FASTQ files
INPUT_DIR="path_to the directory"

# Output directory for FastQC results
OUTPUT_DIR="path_to_the_directory"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# List of file prefixes to process
FILES=("SRR5223500_1" "SRR5223500_2" "SRR5223505_1" "SRR5223505_2" "SRR5223522_1" "SRR5223522_2")

# Loop through each file prefix and run FastQC
for file in "${FILES[@]}"; do
    echo "Processing ${file}.fastq"
    fastqc -o "$OUTPUT_DIR" "$INPUT_DIR/${file}.fastq"
done

echo "FastQC analysis complete."
