library(tidyverse)

output_dir <- "data/tokenized/"

# Create output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
  message("Output directory created successfully.")
} else {
  message("Output directory already exists.")
}

# Load the cleaned data
cleaned_twitter <- readRDS("data/cleaned/cleaned_twitter.rds")
cleaned_blogs <- readRDS("data/cleaned/cleaned_blogs.rds")
cleaned_news <- readRDS("data/cleaned/cleaned_news.rds")

# Tokenize the cleaned twitter data
tokens_unigram_twitter <- tibble(text = cleaned_twitter) %>%
  separate_longer_delim(text, delim = regex("\\s+")) %>%
  rename(word = text) %>%
  filter(word != "")

# Save the tokenized twitter data
saveRDS(tokens_unigram_twitter, file.path(output_dir, "tokens_unigram_twitter.rds"))
cat("Tokenization sample:")
print(head(tokens_unigram_twitter, 10))

# Tokenize the cleaned blogs data
tokens_unigram_blogs <- tibble(text = cleaned_blogs) %>%
    separate_longer_delim(text, delim = regex("\\s+")) %>%
    rename(word = text) %>%
    filter(word != "")

# Save the tokenized blogs data
saveRDS(tokens_unigram_blogs, file.path(output_dir, "tokens_unigram_blogs.rds"))
cat("Tokenization sample:")
print(head(tokens_unigram_blogs, 10))

# Tokenize the cleaned news data
tokens_unigram_news <- tibble(text = cleaned_news) %>%
    separate_longer_delim(text, delim = regex("\\s+")) %>%
    rename(word = text) %>%
    filter(word != "")

# Save the tokenized news data
saveRDS(tokens_unigram_news, file.path(output_dir, "tokens_unigram_news.rds"))
cat("Tokenization sample:")
print(head(tokens_unigram_news, 10))
