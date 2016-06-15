# This script loads and transform the individual tweets
# and manipulate the data into individual features

init <- function() {
  # This function loads the data from the csv file.
  twitter.isis <<- read.csv('./data/tweets.csv')
  parseURL(twitter.isis)
}
init()
