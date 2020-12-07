# Phylogenetic Biology - Final Project

# Biogeography of neotropical anurans of the subfamily Leptodactylinae in Brazil

## Introduction and Goals
The goal of my project is to identify taxa from a widespread neotropical subfamily of anurans (Leptodactylinae) that colonized the Atlantic forest (AT) from the Amazon (AM), to create a phylogenetic framework to investigate their physiological evolution. To do that I will use phylogenetic comparative methods to infer the biogeographic history of tips, with particular interest in the colonization events that happened from the AM to the AF. I will use dated phylogenetic trees from my target taxa obtained from vertlife.org. Occurrence data for all available taxa of interest will be downloaded from the public repositories GBIF, IDIGBIO, and Vertnet, and imported into ArcMap. I will use shapefiles from the major South American ecoregions as defined by Olson et al. (2001) to assign taxa of interest to the ecoregions which they occupy. Then I will use the r package BioGeoBEARS to test different models for the biogeographic history of Leptodactylidae, and select the best supported tree using AIC scores. The phylogenetic tree obtained from that analysis will include ancestral range reconstructions, which allow inferring instances of colonization of the AF by AM lineages. The selective pressures to which organisms are exposed vary according to their geographic distributions, particularly for anurans, which depend on a delicate hydrothermal balance to maintain their activity and metabolism. Understanding the biogeographic history of anurans is therefore very important to understand the evolution of their physiological traits under different climatic conditions.




## Methods

### Data acquisition and management
I downloaded 100 phylogenetic trees for the subfamily Leptodactylinae from vertlife.org and coordinate data from my group of interest from idigbio.com. I pruned trees to include only taxa for which georeferenced coordinates were available. Coordinates were cleaned manually and using the r package CoordinateCleaner. I kept only records that had representatives in the phylogenetic tree and that had coordinates. I also removed any records that weren't identified to the species level.

### Biogeographic analysis
I used the BioGeoBEARS package in r to fit 3 different biogeographic models to the data: DEC, DIVAlike and BayArea, all models were run with or without the founder-event speciation, represented by parameter J. I compared models with corrected AIC (Akaike information criterion) to account for possible effects of sample size. Shapefiles


## Results

The most supported model was DEC + J (![Table 1](https://github.com/julialaterza/finalproject/blob/master/Final_Project/restable_AICc_rellike_formatted.txt) ), so subsequent data visualization and interpretation was derived from the results from that model.

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
