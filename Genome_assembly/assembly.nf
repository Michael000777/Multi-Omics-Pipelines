params.datalinks="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_assembly/data_links.txt"
params.fastqdir="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_assembly/fastqs"

params.read1="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_assembly/fastqs/ERR3335404_1.fastq.gz"
params.read2="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_assembly/fastqs/ERR3335404_2.fastq.gz"


params.SPADES_output="/Users/michael/Documents/Bioinformatics/Personal_Projects/nextflow/Multi-Omics-Pipelines/Genome_assembly/Spades_output"


process download_fastqs {

publishDir("${params.fastqdir}", mode: 'copy')

input:
	path file

output:
	path "*", emit: outputfiles

script:
"""
cat $file | xargs -n 1 -I {} wget '{}'
"""

}

process assemble {

publishDir("${params.SPADES_output}", mode: 'copy')

input:
	path read1_file
	path read2_file

output:
	path "*", emit: assemble_output

script:
"""
echo ${read1_file.simpleName} | cut -d '_' -f1 | xargs -I {} spades.py --careful -1 $read1_file -2 $read2_file -o '{}'

"""

}

workflow {

/*link_channel=Channel.fromPath(params.datalinks)

download_fastqs(link_channel)
download_fastqs.out.outputfiles.view()
*/

read1_ch=Channel.fromPath(params.read1)
read2_ch=Channel.fromPath(params.read2)

assemble(read1_ch, read2_ch)
assemble.out.assemble_output.view()


}
