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

##EITHER use this code if you are returning data where you have only a single value in search parameters 'year' and 'sieve_size_mm'
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/144/S?"

## Use this code to retrieve information from the request URL (inc query parameters) for parameters 'year' and 'sieve_size_mm' with only a single value for each
data <- GET(url_base,query=list(in_year = 2000,
                                in_sieve_size_mm = 1))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR

## Use this code if you have multiple parameter values. Here, values are added to the url for year = 2000 and 2001 and sieve_size_mm = 1. 
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/144/S?in_year=2000&in_year=2001&in_sieve_size_mm=1"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-2 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameters 'valid_aphiaid'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/145/S?"

## Retrieve information from the request URL (inc query parameters)
data <- GET(url_base,query=list(in_valid_aphiaid = 130867))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR

## Use this code if you have multiple values. Here, values are added to the url for valid_aphiaid = 130867 (Sabellaria spinulosa) and valid_aphiaid = 152367 (Lagis koreni)
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/145/S?in_valid_aphiaid=130867&in_valid_aphiaid=152367"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-3 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/146/S?"

## Retrieve information from the request URL (inc query parameters). Enter parameter values in list below. Separate items using '&'
data <- GET(url_base,query=list(in_year = 2000))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR

## Use this code if you have multiple values. Here, values are added to the url for year = 2000 and 2001.
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/146/S?in_year=2000&in_year=2001"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-4 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/148/S?"

## Retrieve information from the request URL (inc query parameters). Enter parameter values in list below. Separate items using '&'
data <- GET(url_base,query=list(in_year = 2014))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR
# Use this code if you have multiple values. Here, values are added to the url for year = 2000 and 2001.
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/148/S?in_year=2013&in_year=2001"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-5 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/149/S?"

## Retrieve information from the request URL (inc query parameters). Enter parameter values in list below. Separate items using '&'
data <- GET(url_base,query=list(in_Survey_name = 'Eastern English Channel Regional Seabed Monitoring Programme 2020'))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR
# Use this code if you have multiple values. Here, survey names are added to the url. Spaces in survey name must be encoded as '%20'.
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/149/S?in_Survey_name=Eastern%20English%20Channel%20Regional%20Seabed%20Monitoring%20Programme%202020"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-6 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/150/S?"

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
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/150/S?in_surveyname=Eastern%20English%20Channel%20Regional%20Seabed%20Monitoring%20Programme%202020"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)
#_______________________________________________________________________________
#### OneBenthicAPI-7 ####

##EITHER use this code if you are returning data where you have only a single value in the search parameter 'year'.
## Url of the api
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/166/S?"

## Retrieve information from the request URL (inc query parameters). Enter parameter values in list below. Separate items using '&'
data <- GET(url_base,query=list(in_year = 2014))

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
class(data_text)
str(data_text)
View(data_text)

#OR
# Use this code if you have multiple values. Here, survey names are added to the url. Spaces in survey name must be encoded as '%20'.
url_base <- "https://rconnectdev.corp.cefas.co.uk/content/166/S?in_year=2014&in_year=2015"
data <- GET(url_base)

## Retrieve contents of a request and make into a df
data_text <- content(data, "text")%>%fromJSON

## Explore returned data
head(data_text)