library(CodeClanData)
library(tidyverse)
library(shiny)
game_sales

publisher_selected <- game_sales %>% 
  select(publisher,
         year_of_release,
         sales,
         platform) %>% 
  filter(publisher == "Electronic Arts" | publisher == "Take-Two Interactive" | publisher == "Ubisoft"  ) %>% 
  filter(platform == "PS4" | platform == "X360")

publisher_selected


