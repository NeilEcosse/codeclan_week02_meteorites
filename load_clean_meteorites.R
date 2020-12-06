
library(dplyr)
library(tidyverse)
library(janitor)
library(assertr)


meteorite_landings <- read_csv("meteorite_landings.csv")

#create vectors of expected variable names and imported variable names
expected_variable_names  <- c("id", "name", "mass (g)", "fall", "year", "GeoLocation")
imported_varirable_names <- c(names(meteorite_landings))


#check if expected variables match imported variables - return error if they do not
stopifnot(
  all(expected_variable_names == imported_varirable_names)
        )

#clean variable names
meteorite_landings <- 
  clean_names(meteorite_landings)


#create separate columns for latitude and longitude
 # remove brackets and comma
  meteorite_landings <- 
  meteorite_landings %>% 
    mutate(geo_location = str_replace_all(geo_location, "\\(|\\)|\\,", "")) %>%

    
# split the column
  meteorite_landings <- 
  meteorite_landings %>%     
    separate(geo_location,
             c("latitude", "longitude"),
             sep =" ",
             convert = TRUE)

  
# replace missing latitude and longitude with 0
meteorite_landings <- 
  meteorite_landings %>%
  mutate(latitude = if_else(is.na(latitude),0,latitude))

meteorite_landings <- 
  meteorite_landings %>%
  mutate(longitude = if_else(is.na(longitude),0,longitude))

  
# check that values for latitude and longitude are valid
meteorite_landings  %>% 
  verify(latitude >= -90 & latitude <= 90) %>% 
  verify(longitude >= -180 & longitude <= 180)

# remove meteorites under 1000g
meteorite_landings <- 
  meteorite_landings %>%
  filter(mass_g >=1000)

# order by year of discovery
meteorite_landings <- 
  meteorite_landings %>% 
  arrange(year)


