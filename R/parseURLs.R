parseURL <- function(twitter.text) {
  require('httr')
  api_key <- 'f5GJD0bch0Gna3xpEKvVKcDzW04rDUBM'
  api_endpoint <- 'http://api.unshorten.it?shortURL='
  sample_link <- 'http://t.co/uqqzXGgVTz'


  link <- paste0(api_endpoint, sample_link,'&apiKey=', api_key)
  response <- GET(link)
  return(content(response, encoding = "UTF-8"))

}



