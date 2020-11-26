setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinsAminos.txt",sep="\t",header=TRUE)

proteins$pos1 <- paste(proteins$amino1,proteins$part1Loc,sep = "")

proteins$pos2 <- mapply(function(x, y) {
  if(!x=="NULL"){
    paste(x,y,sep = "")
  }
  else{
    NA
  }
}, proteins$amino2, proteins$part2Loc)
View(proteins)
proteins = as.matrix(proteins)
write.table(proteins,"proteinssites.txt",sep="\t",row.names=FALSE)