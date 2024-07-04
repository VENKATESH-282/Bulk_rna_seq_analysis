#!/bin/bash

# Directory containing the FASTQ files
INPUT_DIR="path_of_directory"

# Output directory for fastp results
OUTPUT_DIR="path_of_directory"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# List of file prefixes to process
FILES=("SRR5223500" "SRR5223505" "SRR5223522")

# Loop through each file prefix and run fastp
for file in "${FILES[@]}"; do
    echo "Processing ${file}_1.fastq and ${file}_2.fastq"
    fastp -i "$INPUT_DIR/${file}_1.fastq" -I "$INPUT_DIR/${file}_2.fastq" -o "$OUTPUT_DIR/${file}_1_clean.fastq" -O "$OUTPUT_DIR/${file}_2_clean.fastq" -h "$OUTPUT_DIR/${file}_fastp.html" -j "$OUTPUT_DIR/${file}_fastp.json"
done

echo "fastp analysis complete."
