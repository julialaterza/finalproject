
# Load libraries

library(rnaturalearthdata)
library(countrycode)
library(CoordinateCleaner)
library(dplyr)
library(ggplot2)
library(rgbif)
library(sp)
library(phytools)

####################
# PART 1 - GBIF
###################

# Read GBIF data 

gbif <- read.csv("1frog_coordinates_GBIF.csv")


# Select columns of interest
gbif <- gbif %>% select(species, decimalLongitude, decimalLatitude, countryCode, individualCount,
                gbifID, family, taxonRank, coordinateUncertaintyInMeters, year,
                basisOfRecord, institutionCode)

# Select only data that has coordinates
gbif <- gbif %>%
  filter(!is.na(decimalLongitude))%>%
  filter(!is.na(decimalLatitude))

# Plot coordinates in world map
wm <- borders("world", colour="gray50", fill="gray50")
ggplot()+ coord_fixed()+ wm +
  geom_point(data = gbif, aes(x = decimalLongitude, y = decimalLatitude),
             colour = "darkred", size = 0.5)+
  theme_bw()



#convert country code from ISO2c to ISO3c
gbif$countryCode <-  countrycode(gbif$countryCode, origin =  'iso2c', destination = 'iso3c')


#flag problems
gbif <- data.frame(gbif)
flags <- clean_coordinates(x = gbif,
                           lon = "decimalLongitude",
                           lat = "decimalLatitude",
                           countries = "countryCode",
                           species = "species",
                           tests = c("capitals", "centroids", "equal","gbif", "institutions",
                                     "zeros", "countries")) 


summary(flags)
plot(flags, lon = "decimalLongitude", lat = "decimalLatitude")


# Select only records in Brazil
gbif <- gbif %>% filter(countryCode == "BRA")


View(gbif)



















##################
# PART II - IDIGBIO
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



###################
# PART III - VERTNET
###################

# Read VERTNET data 

vertnet <- read.csv("3frog_coordinates_VERTNET.csv")


# Select columns of interest
gbif <- gbif %>% select(scientificname, decimallongitude, decimallatitude, countrycode, individualcount,
                        gbifpublisherid, family, taxonrank, coordinateuncertaintyinmeters, year,
                        basisOfRecord, institutionCode)

gbif <- gbif %>% select(species, decimalLongitude, decimalLatitude, countryCode, individualCount,
                        gbifID, family, taxonRank, coordinateUncertaintyInMeters, year,
                        basisOfRecord, institutionCode)

# Select only data that has coordinates
gbif <- gbif %>%
  filter(!is.na(decimalLongitude))%>%
  filter(!is.na(decimalLatitude))

# Plot coordinates in world map
wm <- borders("world", colour="gray50", fill="gray50")
ggplot()+ coord_fixed()+ wm +
  geom_point(data = gbif, aes(x = decimalLongitude, y = decimalLatitude),
             colour = "darkred", size = 0.5)+
  theme_bw()



#convert country code from ISO2c to ISO3c
gbif$countryCode <-  countrycode(gbif$countryCode, origin =  'iso2c', destination = 'iso3c')


#flag problems
gbif <- data.frame(gbif)
flags <- clean_coordinates(x = gbif,
                           lon = "decimalLongitude",
                           lat = "decimalLatitude",
                           countries = "countryCode",
                           species = "species",
                           tests = c("capitals", "centroids", "equal","gbif", "institutions",
                                     "zeros", "countries")) 


summary(flags)
plot(flags, lon = "decimalLongitude", lat = "decimalLatitude")


# Select only records in Brazil
gbif <- gbif %>% filter(countryCode == "BRA")

