# Phylogenetic Biology - Final Project Minimum Viable Analysis

## Main Goal:
Run frog data through BioGeoBEARS analyses and compare results through likelihood ratio test and AICs

## Specific goals:
1) Prepare phylogenetic tree (newick file) and geographic data (text file) for analyses
2) Run 6 different models (DEC, DEC+J, DIVALIKE, DIVALIKE+J, BAYAREALIKE, BAYAREALIKE+J) available in BioGeoBEARS.
3) Select best model using likelihood ratio test and AICs

## Steps taken in achieving goals:
1) Selected one random phylogenetic tree from multiphylo file with 100 trees (downloaded from http://vertlife.org/) and converted it to newick format. Created a txt file with geographic data formatted for BioGeoBEARS
2) Made R script using the BioGeoBEARS example script as a basis, and ran analyses using my own data
3) Created a job file to run analyses on Grace
4) Ran job file in Grace
5) Downloaded output
