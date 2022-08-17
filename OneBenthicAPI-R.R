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
#### OneBenthicAPI-1 ####

## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/144/S?"

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
#### OneBenthicAPI-2 ####

## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/145/S?"

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_valid_aphiaid = '130867'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returened data
class(data_text)
str(data_text)
View(data_text)