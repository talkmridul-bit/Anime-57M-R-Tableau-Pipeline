library(tidyverse)
library(readr)

data_raw<- read_csv(file.choose())
data_raw

glimpse(data_raw)

final_57M_anime_rating_data<- data_raw %>% distinct() %>%
  mutate(
    user_id = as.integer(user_id),
    anime_id = as.integer(anime_id),
    rating = as.integer(rating)
  ) %>% filter(user_id > 0 & anime_id > 0 & rating > 0 ) %>%
  group_by(user_id) %>%
  summarise(
    Avg_Rating = mean(rating, na.rm = TRUE),
    Total_Rating = n(),
    .groups = 'drop'
  ) %>% arrange(desc(Total_Rating))

final_57M_anime_rating_data

glimpse(final_57M_anime_rating_data)

write.csv(final_57M_anime_rating_data,
          'Anime_rating_57M_data.csv',
          row.names = FALSE)
getwd()
