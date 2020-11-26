setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinsPositions.txt",sep="\t",header=TRUE)
# View(proteins_)
proteins$amino1<-subseq(proteins$part1Stripped, 1,1)
if(!is.na(proteins$part2Stripped)){
  proteins$part2Stripped
  proteins$amino2<-subseq(proteins$part2Stripped, 1,1)
}

proteins$amino2 <- mapply(function(x, y,z) {
  if(!is.na(x)){
    temp <- subseq(x, y, z)
  }
}, proteins$part2Stripped, 1,1)
View(proteins)
proteins = as.matrix(proteins)
write.table(proteins,"proteinsAminos.txt",sep="\t",row.names=FALSE)