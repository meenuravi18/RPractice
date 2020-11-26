setwd(getwd())
library(biomaRt)
library(Biostrings)
library(dplyr)    

library(trackViewer)



readGene<-function(){
  n<-readline("Enter gene id: ")
  return (n)
}
{
  geneid<-readGene()
  write.table(geneid,"input.txt",sep="\t",row.names=FALSE)
}


