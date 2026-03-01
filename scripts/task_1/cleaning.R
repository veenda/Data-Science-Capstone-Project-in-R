library(tidyverse)

output_dir <- "data/cleaned/"

if (!dir.exists(output_dir)) {
  dir.create(output_dir)
  message("Output directory created successfully.")
} else {
  message("Output directory already exists.")
}

extracted_twitter <- readLines("data/extracted/final/en_US/en_US.twitter.txt")
extracted_blogs <- readLines("data/extracted/final/en_US/en_US.blogs.txt")
extracted_news <- readLines("data/extracted/final/en_US/en_US.news.txt")

cleaned_twitter <- extracted_twitter %>%
    str_squish() %>%
    str_replace_all("[^[:alnum:][:space:]]", " ") %>%
    str_replace_all("\\s+", " ") %>%
    str_replace_all("\\d+", " ") %>%
    tolower()

saveRDS(cleaned_twitter, file.path(output_dir, "cleaned_twitter.rds"))
message("Twitter data cleaned successfully.")

cleaned_blogs <- extracted_blogs %>%
    str_squish() %>%
    str_replace_all("[^[:alnum:][:space:]]", " ") %>%
    str_replace_all("\\s+", " ") %>%
    str_replace_all("\\d+", " ") %>%
    tolower()

saveRDS(cleaned_blogs, file.path(output_dir, "cleaned_blogs.rds"))
message("Blogs data cleaned successfully.")

cleaned_news <- extracted_news %>%
    str_squish() %>%
    str_replace_all("[^[:alnum:][:space:]]", " ") %>%
    str_replace_all("\\s+", " ") %>%
    str_replace_all("\\d+", " ") %>%
    tolower()   

saveRDS(cleaned_news, file.path(output_dir, "cleaned_news.rds"))
message("News data cleaned successfully.")