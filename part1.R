#########################################################
#Installing libraries from Bioconductor
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# BiocManager::install(version = "3.12")
# BiocManager::install(c("biomaRt","trackViewer","Biostrings"))
#########################################################

#########################################################
#unpacking zip file to txt file
#library(R.utils)
#gunzip("phosphopeptides.txt.gz",remove=FALSE)
#gunzip("H_sapiens_RefSeq.fasta.gz", remove=FALSE)
#########################################################

#########################################################
#Converting txt file to a table and using biomart to find geneid
setwd(getwd())
library(biomaRt)
library(gtools)
phosphopeptides<-read.table("phosphopeptides.txt", col.names=c("refSeq","Peptide"),sep="\t",header=FALSE)

mart<-useDataset("hsapiens_gene_ensembl",useMart("ensembl"))
refseq<-phosphopeptides$refSeq
geneId<-getBM(attributes=c("refseq_peptide","external_gene_name"),filters="refseq_peptide",values=refseq,mart=mart)

updated<-merge(phosphopeptides,geneId,by.x="refSeq",by.y="refseq_peptide")
write.table(updated,"phosphogene.txt",sep="\t",row.names=FALSE)
View(updated)
#########################################################