#### CODE TO EXTRACT DATA FROM ONEBENTHIC API ####

#https://www.google.com/search?q=R+plumber+get+data+using+api&rlz=1C1CHZN_enGB951GB951&oq=R+plumber+get+data+using+api&aqs=chrome..69i57j33i160l4.16089j0j9&sourceid=chrome&ie=UTF-8#kpvalbx=_Ez37YuGdB4SDgQay1IuQAg15
## Install packages
#install.packages("httr")
#install.packages("jsonlite")
#install.packages("dplyr")

## Load packages
library(httr)
library(jsonlite)
library(dplyr)
#_______________________________________________________________________________
#### OneBenthicAPI-1 Community data ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_1/API-1_with_filters?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_year = '2000',
                                in_sieve_size_mm = '1'
))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)

#_______________________________________________________________________________
#### OneBenthicAPI-2 Taxon data (grab/core) ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_2/API-2?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_valid_aphiaid = '130867'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-3 Sediment data (grab/core) ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_3/API-3?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_year = '2000'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-4 MCZ macrofaunal data ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_4/API-4?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_year = '2014'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-5 Data for use with the OneBenthic Faunal Cluster ID Tool ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_5/API-5?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_Survey_name = 'South Coast Regional Seabed Monitoring Programme 2022'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-6 Data for use with the OneBenthic M-test Tool ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_6/API-6?"#prod server

## Retrieve information from the request URL (inc query parameters). Enter parameter values in list below. Separate items using '&'
data <- GET(url_base,query=list(in_surveyname = 'Eastern English Channel Regional Seabed Monitoring Programme 2020'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR
# Use this code if you have multiple values. Here, survey names are added to the url. Spaces in survey name must be encoded as '%20'.
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_6/API-6?in_surveyname=Eastern%20English%20Channel%20Regional%20Seabed%20Monitoring%20Programme%202020&in_surveyname=South%20Coast%20Regional%20Seabed%20Monitoring%20Programme%202022"#prod server


data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-7 Non-Native Species Data ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_7/API-7?"#prod server

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_year = '2014'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-8 Benthic Traits from the OneBenthic Grab/Core database ####

## Traits sourced from Clare et al. (2022) - see https://rdcu.be/cPF8A

library(httr)
library(jsonlite)
library(dplyr)

## Base URL
base <- "https://rconnect.cefas.co.uk/onebenthic_api_8"

## Helper: call an endpoint and return a data frame
ob_get <- function(endpoint, ...) {
  
  params <- list(...)
  
  response <- GET(
    url   = paste0(base, endpoint),
    query = if (length(params) > 0) params else NULL
  )
  
  stop_for_status(response)
  
  raw <- content(response, "text", encoding = "UTF-8")
  
  if (startsWith(trimws(raw), "<")) {
    stop("API returned HTML instead of JSON — check the endpoint URL.")
  }
  
  jsonlite::fromJSON(raw, flatten = TRUE)
}

## Fetch all traits
all_traits <- ob_get("/API-8_no_filters")

## Filter by taxon
    
## Partial match, case-insensitive (e.g. "Abra" returns all Abra species)
get_traits_by_taxon <- function(taxon_name) {
  all_traits %>%
    filter(grepl(taxon_name, scientificname, ignore.case = TRUE))
}

## Single taxon
abra <- get_traits_by_taxon("Abra alba")

## Partial match — all Abra species
abra_spp <- get_traits_by_taxon("Abra")

## Multiple taxa
taxa_of_interest <- c("Abra alba", "Nephrops norvegicus", "Crangon crangon")
multi <- all_traits %>%
  filter(scientificname %in% taxa_of_interest)
#_______________________________________________________________________________
#### OneBenthicAPI-9 Layers ####

# Load libraries
library(httr)
library(terra)

# API endpoint and layer name
url <- "https://rconnect.cefas.co.uk/onebenthic_api_9/download_raster"
layer_name <- "bolam_et_al_2026_assemblages_model"

# Request raster from API
res <- GET(url, query = list(layer = layer_name))

if (status_code(res) == 200) {
  # Save raster to a temporary file
  tmpfile <- tempfile(fileext = ".tif")
  writeBin(content(res, "raw"), tmpfile)
  
  # Load raster into terra
  r <- rast(tmpfile)
  
  # Plot raster
  plot(r, main = paste("Raster:", layer_name))
  
} else {
  message("Download failed. Status code: ", status_code(res))
  cat("Server response:\n")
  cat(content(res, "text"))
}
#_______________________________________________________________________________
