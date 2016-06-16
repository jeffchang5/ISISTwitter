# This script loads and transform the individual tweets
# and manipulate the data into individual features

init <- function() {
  require('dplyr')
  # This function loads the data from the csv file.
  twitter.isis <- read.csv('./data/tweets.csv')

  #Too intensive, commenting out
  training_data <<- sapply(twitter.isis$tweets, grepURL)
  training_data[[1]]


}
grepURL <- function(string) {
  require('stringr')

  return(str_match(string, 'https?://t.co/[a-zA-Z0-9/-/.]\\S+'))

  #value <- grep(, string, value = TRUE)

}
regexURL <- function(string) {
  sub("https?://t.co/[a-zA-Z0-9/-/.]{1-10}\\S+", 'hello', string)
}

