
# Load libraries

library(rnaturalearthdata)
library(countrycode)
library(CoordinateCleaner)
library(dplyr)
library(ggplot2)
library(rgbif)
library(sp)

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


