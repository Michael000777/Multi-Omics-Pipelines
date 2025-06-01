
process Trim_galore {

publishDir "TRIMMED_reads", mode: 'copy'

input:
	tuple val(sampleid), path(reads)

output:
	path "*"
	path "*trimmed*.fq.gz", emit:trimmed

script:
"""
trim_galore --paired -q 20 --gzip --basename ${sampleid}_trimmed ${reads}

"""
}


process QC {

publishDir "QC_REPORT", mode:'copy'

input:
	path(reads)

output:
	path "*"

script:
"""

fastqc ${reads}
multiqc *fastqc*

mkdir FASTQC
mv *fastqc* FASTQC

"""

}



process STAR_Index {

publishDir "INDEX", mode: 'copy'

input:
	path(fasta)
	path(gtf)

output:
	path "*", emit:index

script:
"""

STAR --runThreadN 8 \\
--runMode genomeGenerate \\
--genomeDir index \\
--genomeFastaFiles ${fasta} \\
--sjdbGTFfile ${gtf} \\
--genomeSAindexNbases 12

"""

}


process STAR_MAPPING{

publishDir "MAPPING", mode: 'copy'

cpus 4

input:
	tuple val(sampleid), path(read1), path(read2),path(index)

output:
	path "*"
	path "*.bam", emit:bams

script:
"""
STAR --runThreadN 4 \\
--genomeDir ${index} \\
--readFilesIn ${read1} ${read2} \\
--outSAMtype BAM SortedByCoordinate \\
--outFileNamePrefix ${sampleid} \\
--readFilesCommand zcat
"""


}



process FEATURE_COUNT {

publishDir "READ_COUNTS", mode: 'copy'

input:
	path(bams)
	path(gtf)
	val(strand)

output:
	path "*"

script:
"""
featureCounts -T 4 -s ${strand} -p --countReadPairs -t exon -g gene_id \\
-Q 10 -a ${gtf} -o gene_count ${bams}

multiqc gene_count*

"""

}




workflow {

fasta_ch=Channel.fromPath(params.ref_fasta)
gtf_ch=Channel.fromPath(params.ref_gtf)

fastqs_ch=Channel.fromFilePairs(params.reads)

strand=Channel.of(params.strandedness)


Trim_galore(fastqs_ch).set{trimmed}

raw_fastq=fastqs_ch.map{items -> items[1]}.flatten().collect()

trimmed_fastq=trimmed.trimmed.flatten().collect()

raw_fastq.mix(trimmed_fastq).collect() | QC

STAR_Index(fasta_ch, gtf_ch).set{star_index}

trimmed.trimmed.map{read1,read2 -> tuple("${read1.getFileName()}".split("_trimmed")[0],read1,read2 ) }
|combine(star_index.index)|STAR_MAPPING
|set{bams}


bams.bams.collect().set{final_bams}

FEATURE_COUNT(final_bams,gtf_ch,strand)

}
