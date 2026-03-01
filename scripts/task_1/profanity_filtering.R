library(tidyverse)

output_dir <- "data/profanity_filtered/"

# Create output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
  message("Output directory created successfully.")
} else {
  message("Output directory already exists.")
}

profanity_url <- "https://raw.githubusercontent.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/master/en"
profanity_file <- "data/profanity_list.txt"

# Check if the profanity list already exists before downloading
if (!file.exists(profanity_file)) {
    message("Downloading profanity list...")
    download.file(profanity_url, destfile = profanity_file)
}

# Load the profanity list
profanity_list <- readLines(profanity_file, encoding = "UTF-8", skipNul = TRUE)

# Load the tokenized data
tokenized_twitter <- readRDS("data/tokenized/tokens_unigram_twitter.rds")
tokenized_blogs <- readRDS("data/tokenized/tokens_unigram_blogs.rds")
tokenized_news <- readRDS("data/tokenized/tokens_unigram_news.rds")

# Filter the tokenized twitter data to remove profanity
filtered_twitter <- tokenized_twitter %>%
    filter(!word %in% profanity_list)

# Save the filtered twitter data
saveRDS(filtered_twitter, file.path(output_dir, "filtered_twitter.rds"))
message("Twitter data profanity filtering completed successfully.")

# Filter the tokenized blogs data to remove profanity
filtered_blogs <- tokenized_blogs %>%
    filter(!word %in% profanity_list)

# Save the filtered blogs data
saveRDS(filtered_blogs, file.path(output_dir, "filtered_blogs.rds"))
message("Blogs data profanity filtering completed successfully.")

# Filter the tokenized news data to remove profanity
filtered_news <- tokenized_news %>%
    filter(!word %in% profanity_list)

# Save the filtered news data
saveRDS(filtered_news, file.path(output_dir, "filtered_news.rds"))
message("News data profanity filtering completed successfully.")