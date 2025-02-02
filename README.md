# Bulk RNA-seq Analysis

This repository contains scripts and data for bulk RNA-seq analysis. The primary script included is used to run FastQC, a quality control tool for high throughput sequence data.

## FastQC Analysis

FastQC is a popular tool for assessing the quality of sequencing data. It provides a simple way to perform quality control checks on raw sequence data coming from high throughput sequencing pipelines.

### Script: `run_fastqc.sh`

The `run_fastqc.sh` script automates the process of running FastQC on a set of FASTQ files. It processes multiple files and generates quality control reports for each one.

### Usage

1. **Directory Structure**:
   - Place your FASTQ files in a directory. In this example, they are located in `/home/tigs/Downloads/venki/Bulk_rna_seq/data`.

2. **Script Location**:
   - The script should be placed in an accessible location. You can modify the paths within the script as needed.

3. **Running the Script**:
   - Ensure the script is executable by running:
     ```sh
     chmod +x run_fastqc.sh
     ```
   - Execute the script:
     ```sh
     ./run_fastqc.sh
     ```

### Script Details

```bash
#!/bin/bash

# Directory containing the FASTQ files
INPUT_DIR="path to directory"

# Output directory for FastQC results
OUTPUT_DIR="path to directory"

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

This repository contains scripts and data for bulk RNA-seq analysis. The primary scripts included are used to run fastp and FastQC, tools for quality control and preprocessing of high throughput sequence data.
 ```
# fastp Analysis

This repository includes scripts and data for bulk RNA-seq analysis, with a focus on using fastp for quality control and preprocessing of high throughput sequencing data.

## fastp Overview

fastp is a tool designed for fast all-in-one preprocessing for FastQ files. It provides extensive statistics and generates visualizations to help researchers quickly evaluate the quality of their sequencing data.

### Script: `run_fastp.sh`

The `run_fastp.sh` script automates the process of running fastp on a set of paired-end FASTQ files.

#### Usage

1. **Directory Structure**:
   - Place your paired-end FASTQ files in a directory. For example, `/home/tigs/Downloads/venki/Bulk_rna_seq/data`.

2. **Running the Script**:
   - Ensure the script is executable:
     ```sh
     chmod +x run_fastp.sh
     ```
   - Execute the script:
     ```sh
     ./run_fastp.sh
     ```

#### Script Details

```bash
#!/bin/bash

# Directory containing the paired-end FASTQ files
INPUT_DIR="path to directory"

# Output directory for fastp results
OUTPUT_DIR="path to directory"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# List of file prefixes to process
FILES=("SRR5223500" "SRR5223505" "SRR5223522")

# Loop through each file prefix and run fastp
for file in "${FILES[@]}"; do
    echo "Processing ${file}_1.fastq and ${file}_2.fastq"
    fastp -i "$INPUT_DIR/${file}_1.fastq" -I "$INPUT_DIR/${file}_2.fastq" \
          -o "$OUTPUT_DIR/${file}_1_clean.fastq" -O "$OUTPUT_DIR/${file}_2_clean.fastq" \
          -h "$OUTPUT_DIR/${file}_fastp.html" -j "$OUTPUT_DIR/${file}_fastp.json"
done

echo "fastp analysis complete."

