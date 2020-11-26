
# Load libraries

library(rnaturalearthdata)
library(countrycode)
library(CoordinateCleaner)
library(dplyr)
library(ggplot2)
library(rgbif)
library(sp)
library(phytools)
library(stringr)
library(Hmisc)

##################
# PART I - IDIGBIO
##################

# Read IDIGBIO data 

idigbio <- read.csv("2frog_coordinates_IDIGBIO.csv")


# Select columns of interest idigbio:isoCountryCode

idigbio <- idigbio %>% select(dwc.scientificName, decimalLongitude, decimalLatitude, idigbio.isoCountryCode, dwc.individualCount,
                        coreid, dwc.taxonRank, dwc.coordinateUncertaintyInMeters, year,
                        dwc.basisOfRecord, dwc.institutionCode)



# Select only data that has coordinates
idigbio <- idigbio %>%
  filter(!is.na(decimalLongitude))%>%
  filter(!is.na(decimalLatitude))


# Remove species names that contain "sp.", "aff.", or "cf."

idigbio <- idigbio %>% filter(!grepl("sp.|aff.|cf.", dwc.scientificName))

# Make new column called "species", that only contains species names (no date and who described it)

idigbio$species <- word(idigbio$dwc.scientificName, 1,2, sep=" ")

# Remove formed "NAs" (records only identified until genus)

idigbio <- idigbio %>%
  filter(!is.na(species))

# Capitalize first letter of species name

idigbio$species <- capitalize(idigbio$species)

# Replace space by underscore ("_") in species names

idigbio$species <- sub(" ", "_", idigbio$species)




# Plot coordinates in world map
wm <- borders("world", colour="gray50", fill="gray50")
ggplot()+ coord_fixed()+ wm +
  geom_point(data = idigbio, aes(x = decimalLongitude, y = decimalLatitude),
             colour = "darkred", size = 0.5)+
  theme_bw()




#flag problems
idigbio <- data.frame(idigbio)
flags <- clean_coordinates(x = idigbio,
                           lon = "decimalLongitude",
                           lat = "decimalLatitude",
                           countries = "idigbio.isoCountryCode",
                           species = "species",
                           tests = c("capitals", "centroids", "equal","gbif", "institutions",
                                     "zeros")) 


summary(flags)
plot(flags, lon = "decimalLongitude", lat = "decimalLatitude")




# Continue analysis

flags <- cf_age(x = idigbio,
                lon = "decimalLongitude",
                lat = "decimalLatitude",
                taxon = "dwc.scientificName",
                min_age = "year",
                max_age = "year",
                value = "flagged")

## Testing temporal outliers on taxon level


idigbio[!flags, "year"]


idigbio <- idigbio[flags, ]


# Write csv of simplified and cleaned data

# write.csv(idigbio, "idigbio.csv")

#########################################################
# Compare species present in idigbio data and in our selected tree

frog_tree <-read.newick(file="frog_newick.newick")

sp_tree <- as.data.frame(unique(frog_tree$tip.label)) 
sp_tree <- sp_tree %>% rename(species = "unique(frog_tree$tip.label)")

sp_idigbio <- unique(idigbio$species)


sp_tree$duplicate <- sp_tree[,1] %in% sp_idigbio


sp_not_in_idig_bio <- sp_tree %>% filter(duplicate == "FALSE")
sp_in_both <- sp_tree %>% filter(duplicate == "TRUE")

####################################################
# Frog Tree managenment 

# Drop species (tips) that don't have coordinate data

tips_to_drop <- as.vector(sp_not_in_idig_bio$species)
frog_tree_reduced = drop.tip(frog_tree, tips_to_drop)


# Confirm all species in final tree occur in both datasets
frog_tree_reduced$tip.label %in% sp_in_both[,1]


######################################################################
# PART III - Format frog ranga data (obtained from QGIS) for BioGeoBEARS
######################################################################

frog_biomes <- read.csv("Frog_biomes_QGIS_atribute_table.csv")

frog_biomes$duplicate <- frog_biomes$species %in% sp_in_both$species

frog_biomes <- frog_biomes %>% filter(duplicate == "TRUE")

# Create data frame showing where each of the species occurs (in terms of biomes)
summary_biomes <- frog_biomes %>% group_by(species) %>% 
  summarise(biome = paste(unique(name), collapse = ', '))

# Write csv
# write.csv(summary_biomes, "summary_biomes_per_species.csv")
