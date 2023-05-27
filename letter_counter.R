library(ggplot2)
library(plotly)

words <- readLines("data/twl06_word_list.txt",warn = FALSE)
scrabble_points <- read.table("data/scrabble_points.txt")
word_lengths <- nchar(words)
n_letter <- 5
words_n <- words[which(word_lengths==5)]
words_matrix <- do.call(rbind,strsplit(words_n,split=""))
letters
words_tables <- apply(words_matrix,2,table)
count_matrix <- 
  sapply(words_tables,function(this_tbl){
    this_tbl[match(letters,names(this_tbl))]
  })
propn_df <- data.frame(count_matrix / length(words_n))

compute_commonality <- function(word_in){
  word_split <- strsplit(word_in,split="")[[1]]
  word_indx <- match(word_split,letters)
  sum(sapply(1:n_letter,function(i) propn_df[word_indx[i],i]),na.rm = TRUE)/n_letter
}
compute_scrabble <- function(word_in){
  word_split <- strsplit(word_in,split="")[[1]]
  word_indx <- match(word_split,scrabble_points$letter)
  sum(scrabble_points$points[word_indx])
}
commonality <- sapply(words_n,compute_commonality)
scrabble    <- sapply(words_n,compute_scrabble)
combined <- data.frame(commonality = commonality,
                       scrabble = scrabble,
                       word = words_n)
ggplot(combined,aes(x = commonality,
                    y = scrabble,
                    label = word)) + 
  geom_point(cex = 0.5,alpha = 0.5)
