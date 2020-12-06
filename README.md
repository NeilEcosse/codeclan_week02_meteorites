# Meteorites project

This project is my week two weekend homework for the CodeClan data analysis course.

## Project structure
The following three files are saved in the project 2020_12_04_meteorites.Rproj:

### 1) meteorite_landings.csv
This is the source data - the file comes from NASA and has information on meteorites that have been found up to the year 2013.

### 2) load_clean_meteorites.R
This contains code which reads in the data, and performs a number of checks and transformations:

1. Loads dplyr, tidyverse, janitor and assertr.

2. Reads in meteorite_landings.csv
  
3. Creates vectors of expected and imported variable names.
The expected variable names are:
  "id", "name", "mass (g)", "fall", "year", "GeoLocation".

4. Checks if imported variables match expected variables - returns an error if they do not.

5. Cleans variable names using the janitor "clean_names" function
  
6. Removes brackets and commas from the variable "geo_location" and then splits it into two new variables, "latitude" and "longitude".
  
7. Removes meteorites under 1000g from the dataset.

8. Removes meteorites where mass is NA from the dataset.
    
9. Replaces missing latitude and longitude values with 0.

10. Checks that values for latitude and longitude are valid: latitude must be between -90 and 90, longitude must be between -180 and 180; returns an error if they are not.

11. Orders the data by the year the meteorite was discovered.

### 3) analyse_meteorites.Rmd
This notebook brings in code to clean and transform the data, and then performs analysis on it.


It contains code chunks which produce the following output:

1. Brings in the code from load_clean_meteorites.R to load packages, read in the source data, then clean and transform the data.

2. Displays the 10 largest meteorites by name and the year of discovery.

3. Displays the average mass for fell versus found meteorites.

4. Displays the number of meteorites per year from 2000 onward.

5. Creates a new version of the meteorite data and adds the column "century"; displays the number of meteorites per century.

6. Checks if meteorite names in the data are unique.

7. Displays the number of meteorites per century where latitude and longitude both equal zero.

8. Displays any meteorites which share part of my name!

