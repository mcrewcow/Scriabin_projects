library(scriabin)

#generate CCIM
panc_fl_ccim <- GenerateCCIM(FD59 , 
                             senders = colnames(FD59 )[FD59 $anno2=="RGC"],
                             receivers = colnames(FD59 )[FD59 $anno2 %notin% "RGC"], assay = 'RNA', species = 'human', slot = 'data')
                             
                           
panc_fl_ccim <- ScaleData(panc_fl_ccim) %>% 
    FindVariableFeatures() %>%
    RunPCA() %>% 
    RunUMAP(dims = 1:10) %>%
    FindNeighbors(dims = 1:10) %>%
    FindClusters(resolution = 0.2)
                             
