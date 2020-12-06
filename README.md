# Meteorites project

This project is my week 2 weekend homework for the CodeClan data analysis course

## Project structure
The following files are saved in the project 2020_12_04_meteorites.Rproj:

### meteorite_landings.csv
This is the source data - the file comes from NASA and has information on meteorites that have been found up to the year 2013.

### load_clean_meteorites.R
This contains code which reads in the data, and performs a number of checks and transformations:

1. Reads in meteorite_landings.csv
  
2. Creates vectors of expected variable names and imported variable names.
The expected variable names are:
  "id", "name", "mass (g)", "fall", "year", "GeoLocation"

3. Checks if imported variables match expected variables - returns an error if they do not.

4. Cleans variable names using the janitor "clean_names" function
  
5. Removes brackets and commas from the variable "geo_location" and then splits it into two new columns, "latitude" and "longitude".
  
6. Removes meteorites under 1000g from the dataset.

7. Removes meteorites where mass is NA from the dataset.
    
8. Replaces missing latitude and longitude values with 0

9. Checks that values for latitude and longitude are valid: latitude must be between -90 and 90, longitude must be between -180 and 180; returns an error if they are not.

10. Orders the data by the year the meteorite was discovered.

### analyse_meteorites.Rmd
This notebook is used to perform analysis on the data.

Currently, it uses copy/pasted code from load_clean_meteorites.R to load and transform the data, but the intention is to link this code in directly.

It contains code chunks which produce the following output:

1. Displays the 10 largest meteorites by name and the year of discovery.

2. Displays the average mass for falling versus found meteorites.

3. Displays the number of meteorites per year from 2000 onwards.


