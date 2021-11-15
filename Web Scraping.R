#packages
library(selectr)
library(xml2)
library(rvest)
library(stringr)
library(jsonlite)

#read content
#specifying the url for desired website to be 
url <- "https://www.amazon.in/OnePlus-Mirror-Black-64GB-Memory/dp/B0756Z43QS?tag=googinhydr18418-21&tag=googinkenshoo-21&ascsubtag=aee9a916-6acd-4409-92ca-3bdbeb549f80"
#reading the html content from 
Amazonwebpage <- read_html(url)

#scrape title of the product
title_html <- html_nodes(Amazonwebpage, "h1#title") 
title <- html_text(title_html)
head(title)

# remove all space and new lines
title <- str_replace_all(title, "[\r\n]", "")
title

#scrape rating of the product
rat_html <- html_nodes(Amazonwebpage, "span#acrPopover") 
rat <- html_text(rat_html)
head(rat)

# remove all space and new lines
rat <- str_replace_all(rat, "[\r\n]", "")
rat

# Scrape size of the product
size_html <- html_nodes(Amazonwebpage, "div#variation_size_name") 
size <- html_text(size_html)
head(size)
size <- str_replace_all(size, "[\r\n]", "")
size

# Scrape colour of the product
col_html <- html_nodes(Amazonwebpage, "div#variation_color_name") 
col <- html_text(col_html)
head(col)
col <- str_replace_all(col, "[\r\n]", "")
col

#Combining all the lists to form a data frameproduct
product_data <- data.frame(Title = title, Rating = rat, Size = size, Color = col)

#Structure of the data frame
str(product_data)

#JSON format
json_data <- toJSON(product_data)
cat(json_data)