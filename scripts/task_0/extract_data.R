library(tidyverse)

# EXTRACT THE DATA
zip_file <- "data/raw/Coursera-SwiftKey.zip"
extract_path <- "data/extracted/"

# If the extracted directory does not exist, unzip the file
if (!dir.exists(extract_path)) {
  unzip(zip_file, exdir = extract_path)
  message("Data extracted successfully.")
} else {
  message("Data already extracted or inaccessible.")
}