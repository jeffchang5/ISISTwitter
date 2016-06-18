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
    return(url)
  }

}
grepURL <- function(string) {
  require('stringr')
  return(str_match(string, 'https?://t.co/[a-zA-Z0-9/-/.]\\S+'))

  #value <- grep(, string, value = TRUE)

}
removeURL <- function(string) {
  return(sub("https?://t.co/[a-zA-Z0-9/-/.]{1-10}\\S+", '', string))
}




