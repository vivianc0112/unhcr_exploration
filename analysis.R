# Analysis of UNHCR data


# Set up ------------------------------------------------------------------

library(tidyverse)
library(countrycode)
library(maps)
all_data <- read.csv("data/population.csv", skip = 14)

# Analysis of UNHCR data


# Set up ------------------------------------------------------------------

# Simple exploration
dim(all_data)
unique(all_data$Year)
length(unique(all_data$Country.of.origin))
length(unique(all_data$Country.of.asylum))

data <- all_data %>% 
  filter(Year == 2020) %>% 
  select(contains("Country"), Asylum.seekers)
dim(data)

country_of_interest <- "ESP"
country_name <- countrycode(country_of_interest, origin = 'iso3c', destination = 'country.name')

country_data <- data %>% 
  filter(Country.of.asylum..ISO. == country_of_interest)
