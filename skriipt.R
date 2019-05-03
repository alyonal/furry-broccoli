library(googleAnalyticsR)
library(tidyverse)
library(lubridate)

googleAnalyticsR::ga_auth()

al <- googleAnalyticsR::ga_account_list()

meta <- googleAnalyticsR::meta

view_id <- al[[33,9]]  # or al_viewID[1]

data_ga <- google_analytics(view_id, 
                            date_range = c("2018-01-01", "2019-01-01"),
                            metrics = "ga:sessions",
                            dimensions = "date")

ggplot(data = data_ga, aes(x = ymd(date), y = sessions)) +
  geom_smooth(colour = "firebrick", size = 2)