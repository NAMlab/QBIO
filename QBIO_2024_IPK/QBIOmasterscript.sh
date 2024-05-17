#!/bin/bash
# The script to rule them all

# Get data from https://www.ebi.ac.uk/ena/browser/view/PRJNA562700
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/017/SRR10056917/SRR10056917_1.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/018/SRR10056918/SRR10056918_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/019/SRR10056919/SRR10056919_1.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/021/SRR10056921/SRR10056921_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/017/SRR10056917/SRR10056917_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/020/SRR10056920/SRR10056920_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/016/SRR10056916/SRR10056916_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/021/SRR10056921/SRR10056921_1.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/019/SRR10056919/SRR10056919_2.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/018/SRR10056918/SRR10056918_1.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/016/SRR10056916/SRR10056916_1.fastq.gz -P fastq_files
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR100/020/SRR10056920/SRR10056920_1.fastq.gz -P fastq_files

# Data Quality assessment (using FastQC)

fastqc -o ~/fastqc/ -t 8 fastq_files/*.fastq.gz

# Mapping
#Downloading reference genome from https://plants.ensembl.org/info/data/ftp/index.html

wget https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/release-57/fasta/solanum_lycopersicum/cdna/

# Unzip the genome
gunzip Solanum_lycopersicum.SL3.0.cdna.all.fa.gz

# Index the genome using kallisto
kallisto index -i Solanum_lycopersicum.SL3.0.cdna.all.index Solanum_lycopersicum.SL3.0.cdna.all.fa

# Perform mapping with Kallisto
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/H3 -t 8 /fastq_files/SRR10056916_1.fastq.gz /fastq_files/SRR10056916_2.fastq.gz &> H3.log
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/H2 -t 8 /fastq_files/SRR10056917_1.fastq.gz /fastq_files/SRR10056917_2.fastq.gz &> H2.log
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/H1 -t 8 /fastq_files/SRR10056918_1.fastq.gz /fastq_files/SRR10056918_2.fastq.gz &> H1.log
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/C3 -t 8 /fastq_files/SRR10056919_1.fastq.gz /fastq_files/SRR10056919_2.fastq.gz &> C3.log
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/C2 -t 8 /fastq_files/SRR10056920_1.fastq.gz /fastq_files/SRR10056920_2.fastq.gz &> C2.log
kallisto quant -i Solanum_lycopersicum.SL3.0.cdna.all.index -o mapped_reads/C1 -t 8 /fastq_files/SRR10056921_1.fastq.gz /fastq_files/SRR10056921_2.fastq.gz &> C1.log
