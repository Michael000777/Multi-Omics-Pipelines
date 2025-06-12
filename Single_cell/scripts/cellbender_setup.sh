#!/bin/bash

# Create environment
conda create -n cellbender_py39 python=3.9 -y
conda activate cellbender_py39

# Install key dependencies
conda install -c conda-forge pytables hdf5
pip install torch==1.13.1 cellbender scanpy anndata

# Avoid OpenMP crash on macOS
export KMP_DUPLICATE_LIB_OK=TRUE

