setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinssites.txt",sep="\t",header=TRUE)
proteins$dash<-('-')

proteins$site <- mapply(function(w,x, y,z) {
  if(!is.na(z)){
    paste(w,x,y,z,sep = "")
  }
  else{
    paste(w,x,y,sep = "")
  }
}, proteins$external_gene_name,proteins$dash,proteins$pos1,proteins$pos2)
View(proteins)
proteins = as.matrix(proteins)
write.table(proteins,"part3Final.txt",sep="\t",row.names=FALSE)