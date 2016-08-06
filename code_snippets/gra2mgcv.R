## Read in a BayesX graph file and output list required by mgcv's mrf smooth
gra2mgcv <- function(file) {
    ## first row contains number of objects in file
    ## graph info is stored in triplets or rows after first row
    ##   - 1st row of triplet is ID
    ##   - 2nd row of triplet is number of neighbours
    ##   - 3rd row of triplet is vector of neighbour
    gra <- readLines(file)
    N <-  gra[1]
    gra <- gra[-1]                      # pop the first row which contains N
    ids <- seq.int(1, by = 3, length.out = N)
    nbs <- seq.int(3, by = 3, length.out = N)
    node2id <- function(nodes, ids) {
        as.numeric(ids[as.numeric(nodes) + 1])
    }
    l <- lapply(strsplit(gra[nbs], " "), node2id, ids = gra[ids])
    names(l) <-  gra[ids]
    l
}
