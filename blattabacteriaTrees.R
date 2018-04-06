## visualization of Blattabacteria trees

## reroot trees in FigTree prior to import

library(ape)
library(phytools)

## load name translation file
names <- read.csv(file="trees/blattabacteriaNamesAll.csv", header=TRUE)

## 16S tree
ribo <- read.tree(file="trees/16S/Blattabacteria16S.phy_phyml_tree_GTRGbs.txt")
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
astral <- read.tree(file="trees/ASTRAL/speciesTreeASTRALwithBS.tre")
plotTree(astral, node.numbers=TRUE)
astral$edge.length <- rep(1,nrow(astral$edge))
astral <- reroot(astral, 19, position=0.5)
## reorder nodes
astral <- ladderize(astral)
## trade names
astral$tip.label <- names$long[match(astral$tip.label,names$short)]
astral$tip.label <- as.character(astral$tip.label)
## modify bootstrap values
astralBS <- astral$node.label
class(astralBS) <- "numeric"
#astralBS[1] <- "" #removing label from root
#astralBS[2] <- 100 #correct support from rerooting
#astralBS[4] <- 98 #correct support from rerooting
#astral$node.label <- astralBS
## test plot
plot(astral, use.edge.length=TRUE)
nodelabels(astral$node.label, cex=0.7, adj=c(1.15,1.25), frame="n")

#PhyloPhan tree
phan <- read.tree(file="trees/PhyloPhan/BlattabacteriumSelection_Named.tree.nwk")
plotTree(phan, node.numbers=TRUE)
phan <- reroot(phan, 29, position=0.5)
## trade names
phan$tip.label <- names$long[match(phan$tip.label,names$BASys)]
phan$tip.label <- as.character(phan$tip.label)
## reorder nodes
phan <- ladderize(phan)

## create figures
tiff(file="BlattabacteriaTrees.tiff", height=150, width=183, units = 'mm', res = 300)
par(mfrow=c(1,2), mar=c(1,1,1,1), oma=c(1,1,1,1))
plot(ladderize(phan))
nodelabels(ribo$node.label, cex=0.7, adj=c(1.3,1.25), frame="n")
add.scale.bar()
mtext("A", outer=TRUE, adj=0.05)
plot(ladderize(astral), use.edge.length=TRUE)
nodelabels(astral$node.label, cex=0.7, adj=c(1.15,1.25), frame="n")
mtext("B", outer=TRUE, adj=0.55)
dev.off()
