setwd(getwd())
library(biomaRt)
library(stringi)
library(Biostrings)
proteins<-read.table("formattedProteins.txt",sep="\t",header=TRUE)
colnames(proteins)<-c('X','refSeq','sequence')
phosphogene<-read.table("phosphogene.txt",sep="\t",header=TRUE)
combined<-merge(phosphogene,proteins,by.x="refSeq")


combined$part1 <- mapply(function(x) {
  
  peptideLen<-stri_length(x)
  starting<-start(matchPattern("*",x))[1]
  strs<-subseq(x, starting-1, peptideLen)
  
}, combined$Peptide)


View(combined)
write.table(combined,"proteinsp1.txt",sep="\t",row.names=FALSE)
