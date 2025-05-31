params.ref="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_indexing/data/Agy99.fasta"
params.index_dir="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_indexing/data"

process genome_index{

publishDir("${params.index_dir}", mode: 'move')

input:
	path genome

output:
	path "*"


script:
"""

bwa index $genome

"""

}


workflow {

ref_channel=Channel.fromPath(params.ref)

genome_index(ref_channel)
genome_index.out.view()

}
