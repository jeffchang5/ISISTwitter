text_mining <- function(text) {
  c <- VCorpus(VectorSource(text))
  c <- tm_map(c, content_transformer(tolower))
  c <- tm_map(c, content_transformer(stripWhitespace))
  c <- tm_map(c, removeWords, stopwords("english"))
  return(c)
}

find_hash_frequency <- function(data) {
  hash <- str_match_all(data, "#\\S+")

}


library(tm)
load('cleanData2.RData')
set.seed(20)
data <- str_replace_all(data, '<[^>]*>' , '')
data <- str_replace_all(data, '\n' , '')
corpus <- text_mining(data)
hash <- str_match_all(data, "#\\S+")
hash <- as.character(hash)


# test <- sapply(data, delete_short)


