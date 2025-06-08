# 🧠 SpatialSage: Deep Learning Framework for Spatial Cell Deconvolution and Tumor Microenvironment Analysis

**Author**: Michael Akpabey  
**Keywords**: Spatial Transcriptomics, Deep Learning, Tangram, Tumor Microenvironment, Graph Neural Networks, Hepatocellular Carcinoma, scRNA-seq, Bioinformatics

---

## 📘 Overview

**SpatialSage** is a bioinformatics project that integrates *spatial transcriptomics* with *deep learning* to uncover the cellular architecture and regulatory dynamics of tumor microenvironments. This project is designed to showcase advanced skills in multi-omics integration, spatial data analysis, and machine learning, with a strong emphasis on interpretability, biological relevance, and code reproducibility.

Recruiters and collaborators will find that this project demonstrates both my deductive reasoning and my technical versatility in the context of complex biological datasets.

---

## 🧪 Project Motivation

The spatial organization of cells in tissues — particularly in cancer — plays a critical role in therapeutic resistance, recurrence, and immune response. Spatial transcriptomics offers a window into this architecture but lacks single-cell resolution. This project bridges that gap using deep learning-based **cell type deconvolution** and **spatial modeling** techniques.

We specifically explore **hepatocellular carcinoma (HCC)** samples treated with **cabozantinib and nivolumab** to identify independent mechanisms of resistance and recurrence.

---

## 🎯 Project Goals

1. **Cell Type Deconvolution**
   - Apply deep learning models (Tangram, Cell2location) to predict the spatial distribution of cell types from scRNA-seq references.

2. **Spatial Microenvironment Mapping**
   - Discover and classify tumor niches using graph-based clustering and spatial feature engineering.

3. **Deep Learning Inference**
   - Train graph neural networks to learn features predictive of treatment response and tissue architecture.

4. **Explainable AI**
   - Interpret cell-cell interaction networks and feature importance using tools like attention maps, GNNExplainer, and spatial gene pattern overlays.

5. **Reproducibility & Communication**
   - Develop clean, modular notebooks and optional dashboards for exploring spatial patterns and inference results interactively.

---

## 📂 Dataset Summary

| Dataset | Description | Source |
|--------|-------------|--------|
| **GSE238264** | Spatial transcriptomics of HCC samples treated with Cabozantinib + Nivolumab | [GEO](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE238264) |
| **scRNA-seq Reference** | Single-cell RNA-seq of liver/HCC tissues for supervised deconvolution | To be selected (GEO/ArrayExpress) |

---

## 🧰 Tools and Technologies

- **Languages**: Python
- **Data Handling**: `Scanpy`, `Squidpy`, `AnnData`
- **Deep Learning & Modeling**:
  - `Tangram` for deconvolution
  - `PyTorch`/`TensorFlow` for GNNs (e.g., `PyTorch Geometric`)
  - `scVI-tools` for probabilistic modeling
- **Visualization**: `Napari`, `Matplotlib`, `Plotly`, `Seaborn`
- **Interactive Dashboard (optional)**: `Streamlit` or `Plotly Dash`

---

## 🧪 Pipeline Overview

```plaintext
[1] Data Curation & Preprocessing
        ↓
[2] Cell Type Deconvolution via Tangram/Cell2location
        ↓
[3] Niche Identification (e.g., with SpaGCN or CellCharter)
        ↓
[4] Graph Neural Network Modeling of Cell-Cell Interactions
        ↓
[5] Model Interpretability & Biological Insight Generation

