############################################################
# Project: Biological Databases – Multi-Source Integration
# Student ID: B269797
# Description:
# Integrate gene, protein, pathway, and miRNA data from
# Ensembl, UniProt, KEGG, and miRBase using R and MySQL.
############################################################

# ---- Load Packages ----
library(DBI)
library(RMySQL)
library(biomaRt)
library(httr)
library(jsonlite)
library(clusterProfiler)
library(org.Hs.eg.db)
library(dplyr)

# ---- Connect to MySQL ----
con <- dbConnect(
  MySQL(),
  user = "your_username",
  password = "your_password",
  dbname = "bioinfo_db",
  host = "localhost"
)

# ---- Gene List ----
genes <- c("ENSMUSG00000036061","ENSMUSG00000000555",
           "ENSMUSG00000023055","ENSMUSG00000075394",
           "ENSMUSG00000001655")

# ---- Ensembl: Gene Annotations ----
ensembl <- useEnsembl(biomart="genes", dataset="mmusculus_gene_ensembl")
gene_df <- getBM(
  attributes=c("ensembl_gene_id","external_gene_name","description",
               "gene_biotype","chromosome_name","start_position",
               "end_position","strand","uniprotswissprot","entrezgene_id"),
  filters="ensembl_gene_id", values=genes, mart=ensembl
)

dbWriteTable(con, "gene_annotations", gene_df, append=TRUE, row.names=FALSE)

# ---- UniProt: Protein Info ----
fetch_protein <- function(uid){
  url <- paste0("https://rest.uniprot.org/uniprotkb/", uid, ".json")
  r <- GET(url)
  if(status_code(r)==200) fromJSON(content(r,"text")) else NULL
}
# Example:
# prot <- fetch_protein("P10629")

# ---- KEGG: Pathway Enrichment ----
entrez <- unique(na.omit(gene_df$entrezgene_id))
kegg_enrich <- enrichKEGG(gene=entrez, organism="mmu",
                          pvalueCutoff=0.05, qvalueCutoff=0.2)
kegg_df <- as.data.frame(kegg_enrich)
dbWriteTable(con, "kegg_data", kegg_df, append=TRUE, row.names=FALSE)

# ---- miRBase: miRNA Mapping ----
mir_df <- getBM(
  attributes=c("ensembl_gene_id","external_gene_name",
               "mirbase_id","mirbase_accession"),
  filters="ensembl_gene_id",
  values="ENSMUSG00000076010", mart=ensembl
)
dbWriteTable(con, "mirna_data", mir_df, append=TRUE, row.names=FALSE)

# ---- Create SQL Summary Table ----
dbExecute(con, "SOURCE B269797_schema.sql")

# ---- Disconnect ----
dbDisconnect(con)

############################################################
# End of Script
############################################################

