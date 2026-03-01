library("tidyverse")
library("tidytext")

output_dir <- "data/tokenized/"

if (!dir.exists(output_dir)) {
  dir.create(output_dir)
  message("Output directory created successfully.")
} else {
  message("Output directory already exists.")
}

cleaned_twitter <- readRDS("data/cleaned/cleaned_twitter.rds")
cleaned_blogs <- readRDS("data/cleaned/cleaned_blogs.rds")
cleaned_news <- readRDS("data/cleaned/cleaned_news.rds")

tokens_unigram_twitter <- tibble(text = cleaned_twitter) %>%
    unnest_tokens(word, text)

saveRDS(tokens_unigram_twitter, file.path(output_dir, "tokens_unigram_twitter.rds"))
print("Tokenization sample:", head(tokens_unigram_twitter, 10))

tokens_unigram_blogs <- tibble(text = cleaned_blogs) %>%
    unnest_tokens(word, text)

saveRDS(tokens_unigram_blogs, file.path(output_dir, "tokens_unigram_blogs.rds"))
print("Tokenization sample:", head(tokens_unigram_blogs, 10))

tokens_unigram_news <- tibble(text = cleaned_news) %>%
    unnest_tokens(word, text)

saveRDS(tokens_unigram_news, file.path(output_dir, "tokens_unigram_news.rds"))
print("Tokenization sample:")
print(head(tokens_unigram_news, 10))
