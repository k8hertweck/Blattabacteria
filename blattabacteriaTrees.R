## visualization of Blattabacteria trees

library(ape)
library(phytools)

setwd("~/Copy/Blattabacteria/")

## load name translation file

## 16S tree
ribo <- read.tree(file="16S/Blattabacteria16S.phy_phyml_tree_GTRGbs.txt")
plot(ribo)
#outgroup16S <- c("EcUM146", "EcUMNK88", "EcCFT073", "EcSe11", "EcCloneDi1", "EcCloneDi2", "EcJJ1886", "EcNA114")
ribo <- midpoint.root(ribo)
plot(ribo)
bs <- ribo$node.label
class(bs) <-"numeric"
bs <- round(bs/10)
bs[bs < 65] <- ""
bs[1] <- ""
bs[18] <- ""
ribo$node.label <- bs

## ASTRAL tree
astral <- read.tree(file="speciesTree/speciesTreeASTRALwithBS.tre")
plot(astral)
#outgroupAstral <- c("Fbranch", "Fjohn", "Fpsych", "Findic", "Fcolum")
astral$edge.length <- rep(1,nrow(astral$edge))
plotTree(astral, node.numbers=TRUE) #root above node 15
astral <- reroot(astral, 17, position=0.5) 
genebs <- astral$node.label
class(genebs) <- "numeric"
genebs[3] <- "100"
astral$node.label <- genebs
#rotate nodes to match between panels

## create figures
#pdf(file="figures/trees.pdf")
par(mfrow=c(1,2))
plot(ladderize(ribo))
nodelabels(ribo$node.label, cex=0.6, adj=c(1.2,-0.4), frame="n")
add.scale.bar()
mtext("A", side=3, line=2, adj=-0.2)
plot(astral, use.edge.length=FALSE)
nodelabels(astral$node.label, cex=1, adj=c(1.2,-0.4), frame="n")
mtext("B", side=3, line=2, adj=-0.2)
#dev.off()
