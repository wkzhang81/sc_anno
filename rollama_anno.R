p_load(Seurat, tidyverse, qs, rollama)
sce <- qread('sce.qs', nthreads = 8)
sce$sample <- gsub('_[0-9]+$','',sce$orig.ident) %>% factor()
sce$cellType <- paste0('c_',sce$seurat_clusters)
sce@active.ident <- sce$seurat_clusters %>% factor()
marker <- FindAllMarkers(sce, 
                         min.pct = 0.3, 
                         logfc.threshold = 1, 
                         only.pos = T)
top_marker <- marker %>% 
  group_by(cluster) %>% 
  top_n(20, avg_log2FC)
options(rollama_model='gpt-oss:20b',
        rollama_config='
      ---------------------------------------
      You are a helpful assistant on gene functions and cellular markers. 
      Every answer must follow this format:
      - H2 bold title.
      - Exactly three bullet points (1–2 sentences each).
      - Total length ≤ 300 words.
      ---------------------------------------
        ')

# for annotation
tissue_type <- 'blood'
DimPlot(sce, label = T, alpha = 0.5) + NoLegend()
for (i in names(table(sce@active.ident))) {
  cat(paste0('\n\n***Results for cluster ',i,':***\n'))
  query(q=paste0('what kind of cell in the ',tissue_type,' has high expressions of ',
                 (top_marker %>% filter(cluster == i))$gene %>% 
                   str_c(collapse = ',')))
  input <- readline(prompt = 'Please input the celltype you want to record: ')
  sce$cellType <- gsub(paste0('^c_',i,'$'),
                       input,
                       sce$cellType)
}
sce@active.ident <- sce$cellType %>% factor()
DimPlot(sce, label = T, repel = T, alpha = 0.5) + NoLegend()
qsave(sce, 'sce.qs', nthreads = 8)
