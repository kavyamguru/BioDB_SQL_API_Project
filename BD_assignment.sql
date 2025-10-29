-- #########################################################
-- Project: Biological Databases – MySQL Schema
-- Student ID: B269797
-- Description:
-- Define schema and relationships for integrated gene,
-- protein, KEGG pathway, and miRNA datasets.
-- #########################################################

CREATE DATABASE IF NOT EXISTS bioinfo_db;
USE bioinfo_db;

-- ---- Gene Annotation Table ----
CREATE TABLE IF NOT EXISTS gene_annotations (
    ensembl_gene_id VARCHAR(30) PRIMARY KEY,
    external_gene_name VARCHAR(50),
    description TEXT,
    gene_biotype VARCHAR(50),
    chromosome_name VARCHAR(10),
    start_position INT,
    end_position INT,
    strand TINYINT,
    uniprotswissprot VARCHAR(20),
    entrezgene_id VARCHAR(20)
);

-- ---- KEGG Pathway Table ----
CREATE TABLE IF NOT EXISTS kegg_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pathway_id VARCHAR(20),
    Description VARCHAR(255),
    pvalue FLOAT,
    qvalue FLOAT,
    geneID VARCHAR(255)
);

-- ---- miRNA Table ----
CREATE TABLE IF NOT EXISTS mirna_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ensembl_gene_id VARCHAR(30),
    external_gene_name VARCHAR(50),
    mirbase_id VARCHAR(30),
    mirbase_accession VARCHAR(30)
);

-- ---- Summary Integration Table ----
CREATE TABLE IF NOT EXISTS summary AS
SELECT 
    g.ensembl_gene_id,
    g.external_gene_name,
    g.description,
    g.gene_biotype,
    k.Description AS pathway,
    k.pvalue,
    m.mirbase_id,
    m.mirbase_accession
FROM gene_annotations g
LEFT JOIN kegg_data k ON g.entrezgene_id = k.geneID
LEFT JOIN mirna_data m ON g.ensembl_gene_id = m.ensembl_gene_id;

-- #########################################################
-- End of SQL Schema
-- #########################################################

