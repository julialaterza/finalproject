# Phylogenetic Biology - Final Project

# Biogeography of neotropical anurans of the subfamily Leptodactylinae in Brazil

## Introduction and Goals
The goal of my project was to identify taxa from a widespread neotropical subfamily of anurans (Leptodactylinae) that colonized the Atlantic forest (AT) from the Amazon (AM), to create a phylogenetic framework to investigate their physiological evolution. To do that I used phylogenetic comparative methods to infer the biogeographic history of tips, with particular interest in the colonization events that happened from the AM to the AF. I used a time calibrated phylogenetic tree from my target taxa obtained from vertlife.org. Occurrence data for all available taxa of interest will be downloaded from the public repositories GBIF, IDIGBIO, and Vertnet, and imported into ArcMap. I will use shapefiles from the major South American ecoregions as defined by Olson et al. (2001) to assign taxa of interest to the ecoregions which they occupy. Then I will use the r package BioGeoBEARS to test different models for the biogeographic history of Leptodactylidae, and select the best supported tree using AIC scores. The phylogenetic tree obtained from that analysis will include ancestral range reconstructions, which allow inferring instances of colonization of the AF by AM lineages. The selective pressures to which organisms are exposed vary according to their geographic distributions, particularly for anurans, which depend on a delicate hydrothermal balance to maintain their activity and metabolism. Understanding the biogeographic history of anurans is therefore very important to understand the evolution of their physiological traits under different climatic conditions.


## Methods

### Data acquisition and management
I downloaded publicly available data for anurans of the family Leptodactylidae from idigbio.com. The raw file contained 6120 records. I selected only taxa that belong to the subfamily Leptodactylinae and removed records that were not identified to the species level (e.g. genus only) using the r package dplyr. Then I used the r package CoordinateCleaner to remove records that did not have coordinate data.
I downloaded 100 time calibrated phylogenetic trees for the subfamily Leptodactylinae from vertlife.org and obtained a consensus tree using package ape in r. The resulting tree was mostly composed of polytomies, with only the genus *Adenomera* and its sister group *Lithodytes lineatus* being recovered in all trees. Due to the large discrepancies across trees I opted to use a randomly selected tree from the posterior distribution for further biogeographic analyses.
I pruned the Leptodactylinae tree, which originally contained 99 species to include only taxa for which georeferenced coordinates were available, and obtained a final tree that contained 53 terminal taxa ![Figure 1](Final_Project/tree_frog.pdf).  

### Biogeographic analysis
I used the BioGeoBEARS package in r to fit 3 different biogeographic models to the data: DEC, DIVAlike and BayArea, all models were run with or without the founder-event speciation, represented by parameter J. I compared models with corrected AIC (Akaike information criterion) to account for possible effects of sample size. Shapefiles


## Results

The most supported model was DEC + J (![Table 1](https://github.com/julialaterza/finalproject/blob/master/Final_Project/restable_AICc_rellike_formatted.txt) ), so subsequent data visualization and interpretation was derived from the results from that model.
![Tree](Final_Project/Frog_DEC_vs_DEC+J_M0_unconstrained_v2.pdf)

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References


Antonelli, A., Zizka, A., Antunes Carvalho, F., Scharn, R., Bacon, C.D., Silvestro, D., and Condamine, F.L. 2018. Amazonia is the primary source of Neotropical biodiversity. Proceedings of the National Academy of Sciences 115:6034–6039.
Fouquet, A., Santana Cassini, C., Fernando Baptista Haddad, C., Pech, N., and Trefaut Rodrigues, M. 2014. Species delimitation, patterns of diversification and historical biogeography of the Neotropical frog genus Adenomera (Anura, Leptodactylidae). Journal of Biogeography 41:855–870.
Matzke, N.J. 2013. Probabilistic historical biogeography: new models for founder‐event speciation, imperfect detection, and fossils allow improved accuracy and model‐testing. Frontiers of Biogeography 5:242–248.
Ree, R.H., and Sanmartin, I. 2018. Conceptual and statistical problems with the DEC+J model of founder-event speciation and its comparison with DEC via model selection. Journal of Biogeography 45:741–749.
Sá, R.O. de, Grant, T., Camargo, A., Heyer, W.R., and Ponssa, M.L. 2014. Systematics of the Neotropical Genus Leptodactylus Fitzinger, 1826 (Anura: Leptodactylidae): Phylogeny, the Relevance of Non-molecular Evidence, and Species Accounts. South American Journal of Herpetology 9:S1–S128.
Santos, J.C., Coloma, L.A., Summers, K., Caldwell, J.P., Ree, R., and Cannatella, D.C. 2009. Amazonian Amphibian Diversity Is Primarily Derived from Late Miocene Andean Lineages. PLoS Biology 7:0448–0461.
