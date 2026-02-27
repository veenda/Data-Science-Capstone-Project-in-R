
# LOAD THE DATA
path <- "data/extracted/final/en_US/"

twitter_file <- file.path(path, "en_US.twitter.txt")
blogs_file <- file.path(path, "en_US.blogs.txt")   
news_file <- file.path(path, "en_US.news.txt")

twitter_data <- readLines(twitter_file, encoding = "UTF-8", skipNul = TRUE)
blogs_data <- readLines(blogs_file, encoding = "UTF-8", skipNul = TRUE)
news_data <- readLines(news_file, encoding = "UTF-8", skipNul = TRUE)

# See Head
cat("Twitter Data Sample:\n")
cat(head(twitter_data), sep = "\n")
cat("\nBlogs Data Sample:\n")
cat(head(blogs_data), sep = "\n")
cat("\nNews Data Sample:\n")
cat(head(news_data), sep = "\n")

# See Tail
cat("\nTwitter Data Tail:\n")
cat(tail(twitter_data), sep = "\n")
cat("\nBlogs Data Tail:\n")
cat(tail(blogs_data), sep = "\n")
cat("\nNews Data Tail:\n")
cat(tail(news_data), sep = "\n")

# See Summary
cat("\nTwitter Data Summary:\n")
summary(twitter_data)
cat("\nBlogs Data Summary:\n")
summary(blogs_data)
cat("\nNews Data Summary:\n")
summary(news_data)

# See Size
cat("\nTwitter Data Size:", object.size(twitter_data), "bytes\n")
cat("Blogs Data Size:", object.size(blogs_data), "bytes\n")
cat("News Data Size:", object.size(news_data), "bytes\n")