library(tidyverse) 
load("rdas/murders.rda") 

murders %>% arrange(population) %>% head()

murders %>% arrange(desc(population)) %>% head()

murders %>% ggplot() + geom_point(aes(x = population/10^6, y = total))
ggsave("figs/total_pop_plot.png")

murders %>% arrange(rate) %>% head()

murders %>% arrange(desc(rate)) %>% head()

murders %>% top_n(10, rate)

murders %>% arrange(desc(rate)) %>% top_n(10)

qplot(murders$region, murders$total, geom = "boxplot")
ggsave("figs/total_region_plot.png")

murders %>% mutate(abb = reorder(abb, rate)) %>%   ggplot(aes(abb, rate)) +  
  geom_bar(width = 0.5, stat = "identity", color = "black") +   coord_flip()
ggsave("figs/barplot.png")


murders %>% ggplot(aes(population/10^6, total, label = abb)) +      
  geom_text(nudge_x = 0.05) +    scale_x_log10() +   scale_y_log10() +   
  xlab("Populations in millions (log scale)") +    ylab("Total number of murders (log scale)") +   
  ggtitle("US Gun Murders in 2010") + geom_point(size = 3, color ="red")
ggsave("figs/log_total_pop_plot.png")
