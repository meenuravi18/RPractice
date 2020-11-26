setwd(getwd())
library(biomaRt)
library(Biostrings)
library(dplyr)    

library(trackViewer)
proteins<-read.table("part3Final.txt",sep="\t",header=TRUE)
input<-read.table("input.txt",sep="\t",header=TRUE)
filtered<-filter(proteins, external_gene_name == input$x)

positions<-as.vector(as.matrix(filtered[,c("part1Loc", "part2Loc")]))
aminos<-as.vector(as.matrix(filtered[,c("amino1", "amino2")]))
positions <- as.numeric(positions[ !( positions =="NULL") ])
aminos <- aminos[ !( aminos =="NULL") ]
endMark<-max(positions)+10

sites <- GRanges("chr1", IRanges(positions, width=1, names=paste0(aminos, positions)))
features <- GRanges("chr1", IRanges(c(1, 501, endMark),
                                    width=c(120, 400, 405)))
sites$score <- runif(length(sites))*5
sites$SNPsideID <- sample(c("top", "bottom"), 
                          length(sites),
                          replace=TRUE)
lolliplot(sites, features,yaxis=FALSE,cex=0.75)