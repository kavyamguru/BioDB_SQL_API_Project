# 🧬 BioDB_SQL_API_Project

This repository contains the *Biological Database Integration Project* developed as part of MSc Bioinformatics coursework.  
It demonstrates the integration of multiple biological data sources — **Ensembl**, **UniProt**, **KEGG**, and **miRBase** — using a combination of **R** scripts and **SQL relational design**.

---

## 📂 Repository Contents

| File | Description |
|------|--------------|
| **BD_assignment.pdf** | Project report documenting the R–SQL integration workflow, methodology, and results. |
| **BD_assignment.R** | Main R script performing data retrieval and integration using REST APIs, BioMart, and MySQL. |
| **BD_assignment.sql** | MySQL schema defining the relational structure for genes, proteins, pathways, and miRNAs. |

---

## ⚙️ Overview

The project builds an **automated data pipeline** to:
1. Retrieve gene and protein data from **Ensembl** and **UniProt** via API.
2. Map **KEGG** pathways and perform functional enrichment using `clusterProfiler`.
3. Integrate **miRNA** information from **miRBase**.
4. Store all data in a structured **MySQL** database for downstream querying and analysis.

---

## 🧩 Key Technologies
- **R** – for scripting, data retrieval, and enrichment analysis  
- **MySQL** – for database design and relational integration  
- **REST APIs** – for accessing UniProt and KEGG resources  
- **biomaRt**, **RMySQL**, **httr**, **jsonlite**, **clusterProfiler** – main R packages used  

---

## 🧠 Learning Outcomes
- Designing relational schemas for biological data  
- Accessing bioinformatics APIs programmatically  
- Integrating heterogeneous biological datasets  
- Applying R-based functional and pathway analysis  
- Bridging R dataframes and SQL tables  

---

## 📊 Database Schema Summary
**Tables included:**
- `gene_annotations` – Ensembl gene information  
- `kegg_data` – KEGG pathway enrichment results  
- `mirna_data` – miRNA mapping  
- `summary` – combined relational table joining all datasets  

