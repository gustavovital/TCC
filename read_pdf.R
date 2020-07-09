# Autor: Alexandre Portugal/Gustavo Vital
# Data: 9/07/2020

# Le as atas do BCB ----

# Pacotes necessários ----

library(pdftools)
library(tidyverse)

# Criando uma função split para remoção de \n ----

split_n <-   function(caracter){
    split <- str_c(unlist(caracter %>%
                            str_split("[\r\n]")), collapse = " ")
  }

# Leitura dos PDF's e criação e um corpus "sujo" ----

texts <- c()

for(ata in 1:length(list.files("Atas"))){
  texts[ata] <- paste("Atas/", list.files("Atas")[ata], sep = "") %>% 
    pdf_text() %>% 
    split_n()
}

# Criando um corpus "sujo" ----

corpus <-
  tibble(doc_id = as.numeric(gsub("([0-9]+).*$", "\\1", list.files("Atas"))),
         text = texts)

corpus <- corpus %>% 
  arrange(doc_id)

rm(ata, texts, split_n)
saveRDS(corpus, 'corpus.rds')

