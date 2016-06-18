unexpandURL <- function(twitter.text) {
  require('httr')
  api_key <- 'f5GJD0bch0Gna3xpEKvVKcDzW04rDUBM'
  api_endpoint <- 'http://api.unshorten.it?shortURL='
  link <- paste0(api_endpoint, twitter.text,'&apiKey=', api_key)
  response <- GET(link)
  if (is.na(twitter.text)) {
    return("false")
  } else {
    url <- content(response, encoding = "UTF-8")
    print(url)
    return(url)
  }

}

grepURL <- function(string) {
  require('stringr')
  return(str_match(string, 'https?://t.co/[a-zA-Z0-9/-/.]\\S+'))

  #value <- grep(, string, value = TRUE)

}
regexURL <- function(string) {
  sub("https?://t.co/[a-zA-Z0-9/-/.]{1-10}\\S+", 'hello', string)
}











# This script loads and transform the individual tweets
# and manipulate the data into individual features

init <- function() {
  require('dplyr')
  # This function loads the data from the csv file.
  #twitter.isis <- read.csv('./data/tweets.csv')
  twitter.isis <- read.csv('tweets.csv')
  #Too intensive, commenting out
  return(twitter.isis %>%
           mutate(links = grepURL(tweets)))


  #print(sapply(twitter.isis$links, expandURL))
  #training_data <<- sapply(twitter.isis$tweets, grepURL)
}
# Runs the init function to get data from the csv and wrangling the data
# to be all UTF-8 and remove any graphical elements that breaks regex.

# Run multiple calls simultaneously
library('parallel')
data <- init()$links
data <- enc2utf8(data)
data <- str_replace_all(data,"[^[:graph:]]", " ")

part2 <- data[15001:16000]




s2 <- sapply(part2, unexpandURL)
save(s2, file = 's16.RData')







