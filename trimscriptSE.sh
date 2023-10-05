#!/bin/bash
# Set path to trimmomatic

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 8 $input1 $output1 \
ILLUMINACLIP:./Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
SLIDINGWINDOW:4:15 MINLEN:70

# Loop through each sample
for sample in SRR10600888 SRR10600877 SRR10600875 SRR10600934 SRR10600933 SRR10600931 SRR10600920 SRR10600919 SRR10600918 SRR10600907 SRR10600906 SRR10600905
do
  # Set input and output file paths
  input1=${sample}.fastq.gz
  output1=${sample}_trimmed.fastq.gz
  
  # Run trimmomatic
  java -jar Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 8 $input1 $output1 \
  ILLUMINACLIP:./Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
  SLIDINGWINDOW:4:15 MINLEN:70
done
