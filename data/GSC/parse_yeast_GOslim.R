# This script parses the Saccharomyces cerevisiae GO slim file into individual gene set collection files.

# the GO slim file was retrieved from https://downloads.yeastgenome.org/curation/literature/go_slim_mapping.tab
# on 2019-07-09, and saved as "go_slim_mapping.tab"

# load the GO slim file and add column names
goslim <- read.delim('go_slim_mapping.tab', header=F, stringsAsFactors=F)
colnames(goslim) <- c('Ensembl', 'Symbol', 'SGD', 'Ontology', 'GSname', 'GSID', 'GeneType')

# remove unnecessary columns
goslim <- goslim[, colnames(goslim) %in% c('Ensembl', 'Ontology', 'GSname')]

# specify ontology names and abbreviations
ontology.names <- c('cellular_component', 'molecular_function', 'biological_process')
ontology.abbrevs <- c('C', 'F', 'P')

# extract and export a gene set collection (GSC) for each of the ontologies
for (i in seq(3)) {
  keep.rows <- (goslim$Ontology %in% ontology.abbrevs[i]) & !(goslim$GSname %in% ontology.names[i])
  gsc <- goslim[keep.rows, c(1,3)]  # omit the 2nd (Ontology) column
  rownames(gsc) <- seq(nrow(gsc))   # update row numbers
  saveRDS(gsc, file=paste(ontology.names[i], 'rds', sep='.'))
}


