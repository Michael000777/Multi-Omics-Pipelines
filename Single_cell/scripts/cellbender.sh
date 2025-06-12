#!/bin/bash

# Quick test: running CellBender on a single sample to evaluate CPU runtime
cellbender remove-background \
    --input ./GSM7494263_AML2_DX_raw_.h5ad \
    --output ../clean_adata/GSM7494263_AML2_DX_raw_denoised.h5ad \
    --total-droplets-included 10000 \
    --epochs 50

# Batch process: denoise all .h5ad files in the current directory using CellBender
for file in *.h5ad; do
    echo "Processing $file..."
    cellbender remove-background \
        --input "$file" \
        --output "../clean_adata/$(basename "$file" .h5ad)_denoised.h5ad" \
        --total-droplets-included 10000 \
done
