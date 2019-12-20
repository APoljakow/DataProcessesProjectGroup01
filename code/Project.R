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
library(rstudioapi)
library(usmap)
library(viridis)
library(DataCombine)
library(tibble)
library(stringr)
library(leaflet)
library(knitr)


setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# GRAPH 01 - Jorge

path_data <- "../data/state-firearms/raw_data.csv"

dataset_state_firearms <- read.csv(path_data,header=TRUE,sep=',')

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

gun_violence <- read.csv("../data/gun-violence-data_01-2013_03-2018.csv", header = TRUE, stringsAsFactors = FALSE)

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

#Graph 03 - Mateusz

federalFirearmLicenseesFile <- "../data/federal-firearm-licensees.csv"

ffLicensees <- read.csv(federalFirearmLicenseesFile, header = TRUE, sep = ",")
#First row doesn't contain data
ffLicensees<- ffLicensees[-1,]

colnames(ffLicensees)

#First we prepare the data
ffLicensees <- ffLicensees %>% 
  mutate(Lic.Regn = as.character(Lic.Regn)) %>% 
  mutate(Lic.Regn = as.numeric(Lic.Regn)) %>% 
  mutate(Lic.Dist = as.character(Lic.Dist)) %>% 
  mutate(Lic.Dist = as.numeric(Lic.Dist)) %>% 
  mutate(Lic.Type = as.character(Lic.Type)) %>% 
  mutate(Lic.Type = as.numeric(Lic.Type)) %>% 
  mutate(Premise.State = as.character(Premise.State)) %>% 
  mutate(Premise.City = as.character(Premise.City)) %>% 
  mutate(Premise.State = as.character(Premise.State)) %>% 
  mutate(Mail.State = as.character(Mail.State)) %>% 
  filter(Premise.State == Mail.State) %>% 
  filter(Premise.City == Mail.City) %>% 
  rename(State = Premise.State) %>% 
  rename(City = Premise.City) %>% 
  select(-c(Premise.Street, License.Name, Business.Name, Premise.Zip.Code, Mail.Street, Mail.Zip.Code, Voice.Phone, 
            Lic.Seqn, Lic.Xprdte, Mail.City, Mail.State))

#Now we can work on it

#Top 3 license types by state
top3LicensesByState <- ffLicensees %>% 
  group_by(State, Lic.Type) %>% 
  tally() %>% 
  top_n(3,n)

#Number of licenses by state
licensesByState <- ffLicensees %>% 
  group_by(State, Lic.Type) %>% 
  tally() %>% 
  summarise(licenses = sum(n)) %>% 
  rename(state = State)



licensesByState <- licensesByState[-c(1),]
plot_3_licenses_map <- plot_usmap(data = licensesByState, values = "licenses", color = "blue") +
  scale_fill_continuous(name = "Number of gun selling licenses", label = scales::comma, low="green", high="red") + 
  theme(legend.position = "right") +
  labs(title = "USA heatmap ")

plot_3_licenses_map

#Graph 04 - Wlad

mass_shootings <- read.csv("../data/Mass_Shootings_Dataset_Ver_5.csv", header = TRUE, stringsAsFactors = FALSE)

mass_shootings$City <- strsplit(mass_shootings$Location,", ")

cityVector <- c()
for(row in mass_shootings$City){
  city <- row[1]
  cityVector <- append(cityVector,city)
}
mass_shootings$City <- cityVector

mass_shootings$State <- strsplit(mass_shootings$Location,", ")
StateVector <- c()
for(row in mass_shootings$State){
  State <- row[2]
  StateVector <- c(StateVector,State)
}
mass_shootings$State <- StateVector

mass_shootings <- mass_shootings %>%
  select(State,City,Latitude,Longitude,Date,Target,Cause,Fatalities,Injured,Total.victims,
         Policeman.Killed,Age,Employeed..Y.N.,Mental.Health.Issues,Race,Gender)


stateNames <- c()
for (state in mass_shootings$State){
  contador <- 0
  if (is.na(state) == FALSE){
    if (grepl(state,"TX") == TRUE){
      stateNames <- c(stateNames,"Texas")
      contador <- 1
    }
    else if (grepl(state,"CO") == TRUE){
      stateNames <- c(stateNames,"Colorado")
      contador <- 1
    }
    else if (grepl(state,"MD") == TRUE){
      stateNames <- c(stateNames,"Maryland")
      contador <- 1
    }
    else if (grepl(state,"NV") == TRUE){
      stateNames <- c(stateNames,"Nevada")
      contador <- 1
    }
    else if (grepl(state,"CA") == TRUE){
      stateNames <- c(stateNames,"California")
      contador <- 1
    }
    else if (grepl(state,"PA") == TRUE){
      stateNames <- c(stateNames,"Pennsylvania")
      contador <- 1
    }
    else if (grepl(state,"WA") == TRUE){
      stateNames <- c(stateNames,"Washington")
      contador <- 1
    }
    else if (grepl(state,"LA") == TRUE){
      stateNames <- c(stateNames,"Louisiana")
      contador <- 1
    }
    else{
      stateNames <- c(stateNames,state)
      contador <- 1
    }
  }
  if (contador != 1){
    stateNames <- c(stateNames,NA)
  }
}

mass_shootings$State <- stateNames


states <- c()
onlyAvailableState <- DropNA(mass_shootings, Var = "State")
for (i in onlyAvailableState$State){
  contador <- 0
  for (state in states){
    if (grepl(state,i) == TRUE){
      contador <- contador + 1
    }
  }
  if (contador == 0){
    states <- c(states,i)
  }
}

repStates <- c()
for (state in states){
  repStates <- c(repStates,state,state)
}

categories <- c()
for (index in states){
  categories <- c(categories,"killed","injured")
}

values <- c()
for (state in states){
  stateFatalities <- onlyAvailableState %>%
    filter(State == state) %>%
    select(Fatalities)
  stateInjured <- onlyAvailableState %>%
    filter(State == state) %>%
    select(Injured)
  sumFatalities <- sum(stateFatalities)
  sumInjuries <- sum(stateInjured)
  values <- c(values,sumFatalities,sumInjuries)
}


victimsPerState <- data.frame(repStates,categories,values)
colours <- c(killed="red",injured="orange")
plot_4_victims_state <- ggplot(victimsPerState, aes(fill=categories, y=values, x=reorder(repStates,values))) + 
  geom_bar(position="stack", stat="identity") +
  coord_flip() +
  labs(fill = "People") +
  labs(x = "State") +
  labs(y = "Total number of victims") +
  scale_y_continuous(breaks = seq(0, 650, 50), limits = c(0, 650), expand = c(0, 0)) +
  scale_fill_manual(values = colours) +
  ggtitle("Victims of mass shootings per State")

plot_4_victims_state

# Graph 05 - Artjom

gun <- as.tibble(data.table::fread(str_c("", "../data/gun-violence-data_01-2013_03-2018.csv"),
                                   header=TRUE,stringsAsFactors = FALSE, na.strings=c("NA", "")))
gun$victims <- gun$n_killed + gun$n_injured

allIncidents <- gun %>% select(incident_id, date, n_killed, n_injured, victims, location_description, city_or_county, state, latitude, longitude) %>% 
  rename(Incident_Id=incident_id, Date=date, Killed=n_killed, Injured=n_injured, Victims=victims, Location=location_description, City=city_or_county) %>%
  arrange(desc(Victims)) 

kable(allIncidents %>% select(-longitude, -latitude))

TopMap <- allIncidents %>% select(latitude, longitude, Victims, City, Location)

TopMap_labels <- paste0("<strong>City: </strong>", TopMap$City, 
                 "<br><strong>Location: </strong>", TopMap$Location,
                 "<br><strong>Victims </strong>", TopMap$Victims) %>% lapply(htmltools::HTML)
complete_Map <- leaflet(TopMap) %>%
  setView(lng=-96, lat=37.8, zoom=4) %>%
  addTiles() %>%
  addProviderTiles("CartoDB.Positron", group="Light map") %>%
  addScaleBar %>%
  addMarkers(~longitude, ~latitude,
             label = TopMap_labels,  
             clusterOptions = markerClusterOptions())







# Results

dataset_gun_violence_data <- read.csv("../data/gun-violence-data_01-2013_03-2018.csv",header=TRUE,sep=',')
dataset_gun_violence_data

populations_state <- read.csv("../data/population-states-2018.csv",header=TRUE,sep=';')

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

# We check that the state variable has been imported as a factor.
is.factor(final_dataset$state)
## We double check that there are no missing values.
sum(is.na(final_dataset))==0


# We create and plot the correlation matrix
correlation_matrix <- round(cor(final_dataset %>% select(-c(state,population,total_killed))),2)
correlation_matrix_complete_plot <- corrplot(correlation_matrix, method="number",type="lower")



# Linear Model

# We define the size of the partition (75%)
smp_size <- floor(0.75 * nrow(final_dataset))

## We set the seed to make the partition reproducible
set.seed(123)

train_ind <- sample(seq_len(nrow(final_dataset)), size = smp_size)
#We create the training and test datasets
train <- final_dataset[train_ind, ]
test <- final_dataset[-train_ind, ]

# We define cross validation through a trainControl
train.control <- trainControl(method="repeatedcv",number=10,repeats=3)

# We define the grid search by setting possible values to the intercept parameter
grid <- expand.grid(intercept=c(-50, -20, -10, -5,-1,  0, 1, 5, 10,20,50))

# define and train the model using caret package
linear_model <- train(rate ~ score + year + state,
               data = train,
               method="lm",
               trControl=train.control,
               tuneGrid=grid)

print(linear_model)

varimp <- varImp(linear_model)
#plot(varimp, main="Variable Importance")
#typeof(varimp)

test$rate_prediction <- predict(linear_model,test)

ggplot(test, aes(rate,rate_prediction)) +
  geom_point() +
  geom_smooth(method = "lm", se = T)


?geom_abline()



