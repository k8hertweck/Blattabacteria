## visualization of Blattabacteria trees

## reroot trees in FigTree prior to import

library(ape)
library(phytools)

setwd("~/Copy/Blattabacteria/")

## load name translation file
names <- read.csv(file="blattabacteriaNames.csv", header=TRUE)

## 16S tree
ribo <- read.tree(file="16S/Blattabacteria16S.phy_phyml_tree_GTRGbs.txt")
plotTree(ribo, node.numbers=TRUE)
## reroot tree
ribo <- midpoint.root(ribo)
## modify bootstrap values
bs <- ribo$node.label
class(bs) <-"numeric"
bs <- round(bs/10)
bs[bs < 65] <- "" #remove low bs values
bs[1] <- "" #replace value at root
bs[14] <- 100 #correct outgroup support from rerooting
bs[15] <- 80 #correct outgroup support from rerooting
ribo$node.label <- bs
## trade names
ribo$tip.label <- names$long[match(ribo$tip.label,names$short)]
ribo$tip.label <- as.character(ribo$tip.label)

## ASTRAL tree
astral <- read.tree(file="speciesTree/speciesTreeASTRALwithBS.tre")
plotTree(astral, node.numbers=TRUE)
astral$edge.length <- rep(1,nrow(astral$edge))
astral <- reroot(astral, 19, position=0.5)
## modify bootstrap values
genebs <- astral$node.label
class(genebs) <- "numeric"
genebs[1] <- "" #removing label from root
genebs[2] <- 100 #correct support from rerooting
genebs[3] <- 98 #correct outgroup support from rerooting
astral$node.label <- genebs
## rotate nodes to match between panels
astral <- ladderize(astral)
astral <- rotate(astral, 16)
astral <- rotate(astral, 22)
astral <- rotate(astral, 23)
astral <- rotate(astral, 24)
astral <- rotate(astral, 25)
## trade names
astral$tip.label <- names$long[match(astral$tip.label,names$short)]
astral$tip.label <- as.character(astral$tip.label)

## create figures
tiff(file="figures/BlattabacteriaTrees.tiff", height=150, width=183, units = 'mm', res = 300)
par(mfrow=c(1,2), mar=c(1,1,1,1), oma=c(1,1,1,1))
plot(ladderize(ribo))
nodelabels(ribo$node.label, cex=0.7, adj=c(1.3,1.25), frame="n")
add.scale.bar()
mtext("A", outer=TRUE, adj=0.05)
plot(ladderize(astral), use.edge.length=FALSE)
nodelabels(astral$node.label, cex=0.7, adj=c(1.15,1.25), frame="n")
mtext("B", outer=TRUE, adj=0.55)
dev.off()
