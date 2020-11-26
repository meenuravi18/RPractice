setwd(getwd())
library(biomaRt)
library(Biostrings)
library (devtools)
library (tidyverse)
source_url("https://raw.githubusercontent.com/lrjoshi/FastaTabular/master/fasta_and_tabular.R")

FastaToTabular("H_sapiens_RefSeq.fasta")

proteins<-read.csv('dna_table.csv',header=TRUE)
View(proteins)

proteins$name <- gsub('>', '', proteins$name)
write.table(proteins,"formattedProteins.txt",sep="\t",row.names=FALSE)