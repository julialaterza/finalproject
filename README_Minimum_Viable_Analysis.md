# Phylogenetic Biology - Final Project Minimum Viable Analysis

## Main Goal:
Run complete BioGeoBEARS analyses with my input data (Leptodactylidae phylogenetic tree and presence absence data of tips in 6 Brazilian biomes)

## Specific goals:
1) Prepare phylogenetic tree (newick file) and geographic data (text file) for analyses
2) Run 6 different models (DEC, DEC+J, DIVALIKE, DIVALIKE+J, BAYAREALIKE, BAYAREALIKE+J) available in BioGeoBEARS.
3) Select best model using likelihood ratio test and AICs

## Steps taken in achieving goals:
1) Selected one random phylogenetic tree from multiphylo file with 100 trees (downloaded from http://vertlife.org/) and converted it to newick format.
2) Created a txt file with geographic data formatted for BioGeoBEARS (this data was invented so I could run the analysis. For the final project I need to get the actual range data for frogs and extract the biomes to which they belong in ArcMap)
3) Made R script using the BioGeoBEARS example script as a basis, but included my own data. Ran it on my local computer
4) Obtained output and saved it to the github repository (output described below)

## Additional steps needed for the complete analysis
5) Clean frog coordinates using the r library Coordinate Cleaner
6) Import frog coordinates and shapefiles of Brazilian biomes to extract actual ranges and include this data in the geographic txt file, to run the analysis again with real data


## Files

### *Script files*
1) R_code_BioGeo_Grace -> R code with BioGeoBEARS analyses
2) job_r.sh -> job file to run R code in Grace

### *Input files*
1) output.nex -> Multiphylo file with 100 trees of frogs from family Leptodactylidae (downloaded from http://vertlife.org/)
2) frog_newick.newick -> Newick file of a randomly selected tree from the output.nex file
3) frog_biomes.txt -> Geographic range file formatted for BioGeoBEARS. These data was invented for the minimum viable analysis; for the final analysis I need to extract the actual geographic data using georeferenced data and shapefiles of Brazilian biomes.

### *Output files*
1) tree_frog.pdf -> Phylogenetic tree used for analyses
2) Frog_DEC_vs_DEC+J_M0_unconstrained_v2.pdf -> Trees with range states on tips and ancestral range reconstruction from DEC and DEC+J analyses
3) Frog_DIVALIKE_vs_DIVALIKE+J_M0_unconstrained_v1.pdf -> Trees with range states on tips and ancestral range reconstruction from DIVALIKE and DIVALIKE+J analyses
4) Frog_BAYAREALIKE_vs_BAYAREALIKE+J_M0_unconstrained_v1.pdf -> Trees with range states on tips and ancestral range reconstruction from BAYAREALIKE and BAYAREALIKE+J analyses
5) restable_AIC_rellike_formatted.txt -> Model weights for all 6 models
6) restable_AICc_rellike_formatted.txt -> Model weights for all 6 models
