# install.packages("dplyr")
# install.packages("plotly")
# install.packages("ggplot2")
# install.packages("lubridate")
# install.packages("zoo")
# install.packages("corrplot")
# install.packages("stats")
# install.packages("tidyverse")
# install.packages("caret")

library(dplyr)
library(plotly)
library(ggplot2)
library(lubridate)
library(zoo)
library(corrplot)
library(stats)
library(mlr)
library(tidyverse)
library(caret)

# GRAPH 01 - Jorge

dataset_state_firearms <- read.csv("C:/Users/jmlga/OneDrive/Universidad/Master/Data_Processes/DataProcessesProjectGroup01/data/state-firearms/raw_data.csv",header=TRUE,sep=',')

score_column <- dataset_state_firearms %>%
  select(-c(state,year,lawtotal)) %>% 
  mutate(score=rowSums(.)) %>% 
  select(score) 

dataset_state_firearms$score <- score_column[,"score"]

dataset_state_firearms <- dataset_state_firearms %>% 
  select(state,year,score)

dataset_state_firearms$score <- ((dataset_state_firearms$score/133)*100)


plot_1_heatmap <- plot_ly(data = dataset_state_firearms,
             x=~year,
             y=~state,
             z=~score,
             type="heatmap",
             colors = c("firebrick","forestgreen"),
             height = 1500,
             width = 800)

plot_1_heatmap

# Graph 02 - Juan Luis

gun_violence <- read.csv("C:/Users/jmlga/OneDrive/Universidad/Master/Data_Processes/DataProcessesProjectGroup01/data/gun-violence-data_01-2013_03-2018.csv", header = TRUE, stringsAsFactors = FALSE)

victims <- gun_violence %>% 
  select(date,n_killed,n_injured) %>%
  mutate(month_year = as.yearmon(date))%>%
  select(-c(date))%>%
  group_by(month_year) %>%
  summarise(sum_killed = sum(n_killed), sum_injured = sum(n_injured))

plot_2_line <- ggplot(victims, aes(month_year)) + 
  geom_line(aes(y = sum_killed, colour = "sum_killed")) + 
  geom_line(aes(y = sum_injured, colour = "sum_injured")) +
  labs(title = "Monthly victims in USA") 

plot_2_line

# Model

dataset_gun_violence_data <- read.csv("C:/Users/jmlga/OneDrive/Universidad/Master/Data_Processes/DataProcessesProjectGroup01/data/gun-violence-data_01-2013_03-2018.csv",header=TRUE,sep=',')
dataset_gun_violence_data

populations_state <- read.csv("C:/Users/jmlga/OneDrive/Universidad/Master/Data_Processes/DataProcessesProjectGroup01/data/population-states-2018.csv",header=TRUE,sep=';')

dataset_gun_violence_data_cut <- dataset_gun_violence_data %>% 
  select(c(date,state,n_killed)) %>% 
  mutate(year=substr(date,0,4)) %>% 
  select(c(year,state,n_killed)) %>% 
  group_by(state,year) %>% 
  summarise(total_killed = sum(n_killed)) %>% 
  filter(year>2013 & year<2018)
  
joined_dataset <- merge(dataset_state_firearms,populations_state,by="state") %>% 
  filter(year>2013 & year<2018)

final_dataset <- merge(joined_dataset,dataset_gun_violence_data_cut,by=c("state","year")) %>% 
  mutate(rate=total_killed/population)

correlation_matrix <- round(cor(final_dataset %>% select(-c(state,population,total_killed))),2)

correlation_matrix_complete_plot <- corrplot(correlation_matrix, method="number",type="lower")

# Linear Model -Tenemos muy pocos datos, probablemente no valga para nada.

smp_size <- floor(0.75 * nrow(final_dataset))

## set the seed to make your partition reproducible
set.seed(123)

train_ind <- sample(seq_len(nrow(final_dataset)), size = smp_size)

train <- final_dataset[train_ind, ]
test <- final_dataset[-train_ind, ]

train.control <- trainControl(method="repeatedcv",number=10,repeats=3)

linear_model <- train(rate ~ score + year + state,
               data = train,
               method="lm",
               trControl=train.control)

print(linear_model)

test$rate_prediction <- predict(linear_model,test)

plot(test$rate,test$rate_prediction)
