
# LOAD THE DATA
path <- "data/extracted/final/en_US/"

twitter_file <- file.path(path, "en_US.twitter.txt")
blogs_file <- file.path(path, "en_US.blogs.txt")   
news_file <- file.path(path, "en_US.news.txt")

twitter_data <- readLines(twitter_file, encoding = "UTF-8", skipNul = TRUE)
blogs_data <- readLines(blogs_file, encoding = "UTF-8", skipNul = TRUE)
news_data <- readLines(news_file, encoding = "UTF-8", skipNul = TRUE)

summary_df <- data.frame(
    Source = c("Twitter", "Blogs", "News"),
    Lines = c(length(twitter_data), length(blogs_data), length(news_data))
)

print(summary_df)