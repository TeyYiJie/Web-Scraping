library(rvest)
library(dplyr)

link = "https://www.imdb.com/search/title/?title_type=feature&num_votes=25000,&genres=adventure&sort=user_rating,desc"
page = read_html(link)

title = page %>% html_nodes(".lister-item-header a") %>% html_text()
director = page %>% html_nodes(".text-muted+ p a:nth-child(1)") %>% html_text()
year = page %>% html_nodes(".text-muted.unbold") %>% html_text()
rating = page %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
duration = page %>% html_nodes(".runtime") %>% html_text()
genre = page %>% html_nodes(".genre") %>% html_text()
synopsis = page %>% html_node(".ratings-bar+ .text-muted") %>% html_text()

movies = data.frame(title, director, year, rating, duration, genre, synopsis, stringsAsFactors = FALSE)
write.csv(movies, "movies.csv")