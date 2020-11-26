setwd(getwd())
library(biomaRt)
library(Biostrings)
proteins<-read.table("proteinsStripped.txt",sep="\t",header=TRUE)


proteins$part1Loc <- mapply(function(x, y) {
  temp <- matchPattern(x, y, max.mismatch=1, min.mismatch=0, 
                       with.indels=FALSE, fixed=TRUE, algorithm="auto")
  start(temp)[1]
}, proteins$part1Stripped, proteins$sequence)

proteins$part2Loc <- mapply(function(x, y) {
  if(!is.na(x)){
    temp <- matchPattern(x, y, max.mismatch=1, min.mismatch=0, 
                         with.indels=FALSE, fixed=TRUE, algorithm="auto")
    start(temp)[1]}
}, proteins$part2Stripped, proteins$sequence)
View(proteins)
proteins = as.matrix(proteins)
write.table(proteins,"proteinsPositions.txt",sep="\t",row.names=FALSE)

