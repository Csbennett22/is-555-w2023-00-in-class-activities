library(tidyverse)

algs <- read_csv('https://www.dropbox.com/s/qomjauiqxb8o4qd/kaggle_algoriths.csv?dl=1')

algs %>% count(algorithm)

algs %>% 
  mutate(is_student = if_else(current_title == 'Student' | current_title == 'Currently not employed', 'Student', 'Other')) %>% 
  ggplot(aes(x=algorithm, fill = languages)) + 
  theme_bw()+
  geom_bar(stat = "count", position = 'stack') +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+     
  facet_wrap(~is_student, nrow = 5, scales = 'free_y')
