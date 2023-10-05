#!/bin/bash
# Set path to trimmomatic

#java -jar Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 8 $input1 $output1 \
#ILLUMINACLIP:./Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
#SLIDINGWINDOW:4:15 MINLEN:70

  java -jar ~/course/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 8 SRR8668759.fastq.gz SRR8668759_trimmed.fastq.gz \
  ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
  SLIDINGWINDOW:4:15 MINLEN:70
#ILLUMINACLIP:./Trimmomatic-0.39/adapters/TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
#!/bin/bash
# This script downloads the SRR files from a self-made textfile containing all the necessary links.
# After downloading the files it will compare the corresponding md5sum which are contained in another self-made textfile.


# Loop through each sample
for sample in SRR8668757 # SRR8668769 SRR8668773 SRR8668755 SRR8668758 SRR8668771 SRR8668774 SRR8668756 SRR8668759 SRR8668772
do
  # Set input and output file paths
  input1=${sample}.fastq.gz
  output1=${sample}_trimmed.fastq.gz
  
  # Run trimmomatic
  java -jar ~/course/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 8 $input1 $output1 \
  ILLUMINACLIP:TruSeq3-SE.fa:2:30:10 HEADCROP:5 \
  SLIDINGWINDOW:4:15 MINLEN:70
done
