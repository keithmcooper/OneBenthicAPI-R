#### CODE TO EXTRACT DATA FROM ONEBENTHIC API ####

#https://www.google.com/search?q=R+plumber+get+data+using+api&rlz=1C1CHZN_enGB951GB951&oq=R+plumber+get+data+using+api&aqs=chrome..69i57j33i160l4.16089j0j9&sourceid=chrome&ie=UTF-8#kpvalbx=_Ez37YuGdB4SDgQay1IuQAg15
## Install packages
#install.packages("httr")
#install.packages("jsonlite")
#install.packages("dplyr")

## Load packages
require("httr")
require("jsonlite")
library(dplyr)
#_______________________________________________________________________________
#### OneBenthicAPI-1 Community data ####

## Url of the api
url_base <- "https://rconnect.cefas.co.uk/onebenthic_api_1/API-1?"#prod server

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
