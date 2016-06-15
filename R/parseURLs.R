parseURL <- function(twitter.text) {
  api_key <- 'f5GJD0bch0Gna3xpEKvVKcDzW04rDUBM'
  api_endpoint <- 'http://api.unshorten.it?shortURL='
  sample_link <- 'http://t.co/uqqzXGgVTz'

  require('httr')
  require('dplyr')
  print(paste0(api_endpoint, sample_link, '&apiKey=', api_key))
  response <- GET(paste(api_endpoint, sample_link, '&apiKey=', api_key))
  print(response)

}


