setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinsp1.txt",sep="\t",header=TRUE)

proteins$part2 <- mapply(function(x) {
  numStars<-letterFrequency(BString(x),"*", as.prob=FALSE)
  if(numStars==2){
    peptideLen<-stri_length(x)
    starting<-start(matchPattern("*",x))[2]
    strs<-subseq(x, starting-1, peptideLen)}
  else{
    strs<-NA
    
  }
}, proteins$part1)
View(proteins)


write.table(proteins,"proteinsp2.txt",sep="\t",row.names=FALSE)