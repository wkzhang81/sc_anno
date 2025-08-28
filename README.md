# A simple way to understand and annotate scRNAseq data
## ABSTRACT
  Since its introduction in 2009, single-cell RNA sequencing (scRNA-seq) has transformed biological research by enabling large-scale cell mapping, uncovering novel cell subtypes, and integrating multiomics data. A critical step in this process is cell annotation, which links gene expression profiles to biological identities, aiding in understanding cellular heterogeneity and disease mechanisms. This step also serves as a valuable learning opportunity for researchers. To improve efficiency and security, we propose a semi-automated cell annotation workflow using OpenAI open-source GPT-OSS-20B model, which can be run locally via Ollama and integrated into R using the rollama package. This method is cost-effective, user-friendly, and provides precise annotations with biological insights, as demonstrated in our results. This approach simplifies scRNA-seq data analysis, promoting broader adoption and further advancements in the field.

## Pre-requirement
- Ollama: https://ollama.com/download
- gpt-oss:20b： https://ollama.com/library/gpt-oss
- pbmc data: http://cf.10xgenomics.com/samples/cell-exp/3.0.0/pbmc_10k_v3/pbmc_10k_v3_filtered_feature_bc_matrix.tar.gz
- R: https://www.r-project.org/
- Rstudio or jupyter lab
- rollama package: https://github.com/JBGruber/rollama
<img width="4000" height="2250" alt="figure1_lowres" src="https://github.com/user-attachments/assets/b0cad29f-7a1a-42fb-a1d2-bbfa62501ce7" />

## Results
<img width="4000" height="2250" alt="figure2_lowres" src="https://github.com/user-attachments/assets/5606073b-1dbc-4414-91fb-87dfa2bfb6b8" />

## Notes
- Please read the ***instruction*** first
- Detailed code was included in ***annotation_of_sample_sce.html*** or ***rollama_anno.R***
- the following prompt was quite important but can be optimized due to your special needs:
```
      You are a helpful assistant on gene functions and cellular markers. 
      Every answer must follow this format:
      - H2 bold title.
      - Exactly three bullet points (1–2 sentences each).
      - Total length ≤ 300 words.
```

## To us, ANNOTATION is a process of learning! 
## So enjoy it and don't pass it directly to automation!!!
