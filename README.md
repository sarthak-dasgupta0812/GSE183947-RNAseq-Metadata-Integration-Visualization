# GSE183947-RNAseq-Metadata-Integration-Visualization
Comprehensive R-based RNA-seq data manipulation and visualization workflow for GSE183947. Integrated GEO metadata with FPKM expression data, performed data reshaping, cleaning, annotation, and exploratory analysis. Generated bar ,density plots and heatmaps to interpret gene-level expression patterns across tissue and metastasis conditions.


## 1. Project Overview

This project presents a structured R workflow for RNA-seq exploratory analysis using the GSE183947 dataset from GEO. It demonstrates metadata extraction, cleaning, integration with gene expression data, reshaping into tidy format, summary statistics calculation, and visualization of biologically relevant patterns across tissue and metastasis conditions.

---

## 2. Dataset

* Dataset ID: GSE183947
* Source: NCBI Gene Expression Omnibus
* Data type: RNA-seq (FPKM matrix)
* Samples: 60
* Metadata variables used:

  * Tissue
  * Metastasis status

---

## 3. Tools and Libraries

* R
* tidyverse (dplyr, tidyr, ggplot2)
* GEOquery
* dbplyr

---

## 4. Workflow

### 4.1 Data Import

1. Imported FPKM expression matrix using read.csv().
2. Retrieved GEO metadata using getGEO().
3. Extracted phenotype data using pData(phenoData()).

---

### 4.2 Metadata Cleaning

1. Selected relevant metadata columns.
2. Renamed complex GEO column headers to meaningful names.
3. Cleaned string values using gsub().
4. Created structured metadata table for integration.

---

### 4.3 Data Reshaping

1. Renamed gene identifier column.
2. Converted wide expression matrix to long format using gather().
3. Joined expression data with cleaned metadata using left_join().

---

### 4.4 Exploratory Gene Analysis

1. Filtered genes of interest (TSPAN6, TNMD, DPM1, etc.).
2. Grouped data by gene and tissue type.
3. Calculated mean and median FPKM values.
4. Arranged results for comparative interpretation.

---

### 4.5 Visualization

1. Bar plots for sample-level gene expression.
2. Density plots for distribution across tissue types.
3. Boxplots and violin plots for metastasis comparison.
4. Scatterplots with linear regression for gene–gene correlation.
5. Heatmaps for multi-gene expression visualization.

---

### 4.6 Output Export

1. Saved plots using ggsave().
2. Exported heatmaps as PDF files.

---

## 5. Key Features

* Metadata-driven transcriptomic analysis
* Tidy data restructuring
* Condition-based expression comparison
* Gene correlation visualization
* Reproducible and modular R workflow

---

## 6. Applications

* RNA-seq exploratory data analysis
* Transcriptomic pattern interpretation
* Biomarker candidate visualization
* GEO dataset processing template
* Educational RNA-seq workflow demonstration

---

