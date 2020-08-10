# Codigo para o valence score - vader
# 
# Autor: gustavoovital/alexandre portugal

# install.packages('vader')

corpus <- readRDS('corpus.rds')
library(vader)

pos <- c()
neg <- c()
neu <- c()


for(i in 1:nrow(corpus)){
  
  # constroi uma serie temporal a partir dos valores dados pelo vader
  # sem acrescimos de palavras
  Vader <- vader_df(corpus$text[i])
  
  pos[i] <- Vader$pos
  neg[i] <- Vader$neg
  neu[i] <- Vader$neu
}

saveRDS(pos, 'pos.rds')
saveRDS(neg, 'neg.rds')
saveRDS(neu, 'neu.rds')

# par(mfrow = c(3,1))
# plot(pos, type = 'l', col = 'blue')
# plot(neg, type = 'l', col = 'blue')
# plot(neu, type = 'l', col = 'blue')
