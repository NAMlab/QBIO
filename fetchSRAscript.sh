
prefetch SRR8668759 
fastq-dump --outdir fastq --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip SRAfetch/sra/SRR2121685.sra


# Loop through each sample
for sample in SRR17655898 SRR17655903 SRR17655906 SRR17655907
do
  # Set input and output file paths
  input1=${sample}
  input2=SRAfetch/sra/${sample}.sra

  #Prefetch data
  prefetch $input1  

  #Construct fastq.gz
  fastq-dump --outdir fastq --gzip --skip-technical  --readids --read-filter pass --dumpbase --split-3 --clip $input2
  
done
