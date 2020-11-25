
# Load libraries

library(rnaturalearthdata)
library(countrycode)
library(CoordinateCleaner)
library(dplyr)
library(ggplot2)
library(rgbif)
library(sp)
library(phytools)

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
                           species = "dwc.scientificName",
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




sp_idigbio <- unique(idigbio$dwc.scientificName)


frog_tree <-read.newick(file="frog_newick.newick")



