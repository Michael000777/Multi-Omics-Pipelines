# 🧬 Multi-Omics-Pipelines

**Modular Nextflow pipelines for scalable, reproducible multi-omics workflows**  
This repository provides robust pipelines for high-throughput genomics applications, including **de novo genome assembly** and **RNA-seq transcript quantification**. Each pipeline is designed to be portable across compute environments and easily extendable to additional omics layers.

---

## 📦 Available Pipelines

### 1. `assembly.nf` – Genome Assembly Workflow  
Performs quality control, trimming, and genome assembly using `FastQC`, `Trimmomatic`, and `SPAdes`.

**Workflow Steps:**
- FastQC → Trimmomatic → SPAdes → MultiQC

**Input**: Paired-end FASTQ files  
**Output**: Assembly FASTA, quality reports, log files

---

### 2. `transcript.nf` – RNA-seq Quantification Workflow  
Performs read alignment and gene-level quantification using `STAR` and `featureCounts`.

**Workflow Steps:**
- Index genome → Align reads with STAR → Count features with featureCounts

**Input**: Paired-end FASTQ files + reference genome (FASTA) + annotation file (GTF)  
**Output**: Gene count matrix, alignment BAM files, and log files

---

### Example Command:
```bash
nextflow run transcript.nf --reads 'data/transcript/*.fastq.gz' \
                           --gtf 'reference/annotation.gtf' \
                           --genome 'reference/genome.fa'
```

---

## 🛠️ Technologies Used

- [Nextflow](https://www.nextflow.io/) – workflow engine  
- [SPAdes](https://github.com/ablab/spades) – genome assembly  
- [Kallisto](https://pachterlab.github.io/kallisto/) – RNA-seq quantification  
- [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) – QC  
- [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic) – read trimming  
- [MultiQC](https://multiqc.info/) – summary reporting

---

## ⚙️ Running the Pipelines

Clone the repo and run the workflow using Nextflow:

```bash
git clone https://github.com/Michael000777/Multi-Omics-Pipelines.git
cd Multi-Omics-Pipelines
