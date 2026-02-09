# BioDB_SQL_API_Project

Biological database integration project combining **R + SQL + APIs** to unify annotations from Ensembl, UniProt, KEGG, and miRBase.

## Objective
Build a reproducible mini data-integration pipeline that:
1. retrieves biological entities from major resources,
2. standardizes identifiers,
3. stores harmonized records in a relational schema,
4. supports downstream querying and interpretation.

## Repository Contents
- `BD_assignment.R` — R workflow for API retrieval, transformation, and integration
- `BD_assignment.sql` — relational schema and SQL components
- `BD_asignment.pdf` — coursework/report documentation

## Skills Demonstrated
- API-driven biological data ingestion
- relational schema design for bioinformatics entities
- R-to-SQL integration workflows
- reproducible scripting and data transformation logic

## Core Tools
- R (`httr`, `jsonlite`, `biomaRt`, `RMySQL`, `clusterProfiler`)
- MySQL
- REST APIs (UniProt, KEGG; Ensembl access patterns)

## Run Concept (high-level)
1. Configure database credentials in R script.
2. Execute data retrieval and mapping functions.
3. Persist mapped outputs into normalized SQL tables.
4. Validate integrated tables with SQL queries and summary checks.

## Recruiter-facing Note
This project highlights real-world integration thinking: moving from fragmented biological sources to a queryable, analysis-ready data model.
