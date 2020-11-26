setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinsp2.txt",sep="\t",header=TRUE)

proteins$part1Stripped<-gsub("[^[:alnum:]]", "", proteins$part1)
proteins$part2Stripped<-gsub("[^[:alnum:]]", "", proteins$part2)
View(proteins)
write.table(proteins,"proteinsStripped.txt",sep="\t",row.names=FALSE)