unexpandURL <- function(twitter.text) {
  require('httr')
  api_key <- 'f5GJD0bch0Gna3xpEKvVKcDzW04rDUBM'
  api_endpoint <- 'http://api.unshorten.it?shortURL='
  link <- paste0(api_endpoint, twitter.text, '&apiKey=', api_key)
  response <- GET(link)
  if (is.na(twitter.text)) {
    return("false")
  } else {
    url <- content(response, encoding = "UTF-8")
    print(url)
    return(url)
  }
}











# This script loads and transform the individual tweets
# and manipulate the data into individual features

getData <- function() {
  require('dplyr')
  # This function loads the data from the csv file.
  #twitter.isis <- read.csv('./data/tweets.csv')
  twitter.isis <- read.csv('tweets.csv')
  #Too intensive, commenting out
  return(twitter.isis %>%
           mutate(links = grepURL(tweets)))
}
getRawData <- function() {
  require('dplyr')
  # This function loads the data from the csv file.
  #twitter.isis <- read.csv('./data/tweets.csv')
  twitter.isis <- read.csv('tweets.csv')
  #Too intensive, commenting out
  return(twitter.isis)
}
expand <- function() {
  ## Runs the init function to get data from the csv and wrangling the data
  ## to be all UTF-8 and remove any graphical elements that breaks regex.
  data <- init()$links
  data <- enc2utf8(data)
  data <- str_replace_all(data, "[^[:graph:]]", "")
  ## This makes n API calls. 17,000 observations will take an excessive amount
  ## of times
  return(sapply(data, unexpandURL))
}

cleanData <- function(data.frame) {
  data.cleaned <- sapply(data.frame, cleanURL)
  data.cleaned <- enc2utf8(data.cleaned)
  data.cleaned <- str_replace_all(data.cleaned, "[^[:graph:]]", "")
  # Removes all non-ascii

  return(data.cleaned)
}

## Did some of the cleanup work
removeURLInit <- function() {
  require('stringr')
  data <- as.list(levels(getRawData()$tweets))
  print(data)
  clean.data <- lapply(data, cleanURL)
  cleaner.data <- rm_non_ascii(as.character(clean.data))
  cleanerer.data <- str_replace_all(cleaner.data, "[(_)(&amp;)]", '')
  cleanererer.data <- str_replace_all(cleanerer.data, "[(:)(\n)(\t)]", ' ')
  cleanererer.data <- str_replace_all(cleanererererer.data, "[!@$%^&*()-=_+|;':\",.<>?']", ' ')

}
