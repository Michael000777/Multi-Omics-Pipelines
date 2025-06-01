params.fastq="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/long_reads_genome_assembly/fastqs"
params.flye_out="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/long_reads_genome_assembly/FLYE_OUT"


process assembly_Long {

publishDir("${params.flye_out}", mode: 'move')

input:
 	path fastq

output:

	path "*"

script:

"""

flye --nano-raw $fastq -o ${fastq.simpleName} -g 5.9m

"""
}


workflow {

file_ch = Channel.fromPath(params.fastq)
assembly_Long(file_ch)
assembly_Long.out.view()

}
