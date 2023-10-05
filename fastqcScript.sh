# From the course directory
fastqc -o course_dataQC/ -t 8 course_data/SRR8668759.fastq.gz

# From the course_data directory
fastqc -o ~/course/course_dataQC/ -t 8 SRR8668759.fastq.gz
fastqc -o course_dataQC/ -t 8 SRR8668759.fastq.gz

# From the course_data directory
fastqc -o ~/course/course_dataQC/ -t 8 *.fastq.gz