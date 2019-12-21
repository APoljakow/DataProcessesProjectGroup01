#install.packages("DataCombine")
library(rstudioapi)
library(dplyr)
library(tidyverse)
library(viridis)
library(ggplot2)
library(DataCombine)

current_path <- getActiveDocumentContext()$path
setwd(dirname(current_path ))
print( getwd() )


mass_shootings <- read.csv("../data/Mass Shootings Dataset Ver 5.csv", header = TRUE, stringsAsFactors = FALSE)

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
ggplot(victimsPerState, aes(fill=categories, y=values, x=reorder(repStates,values))) + 
  geom_bar(position="stack", stat="identity") +
  coord_flip() +
  labs(fill = "People") +
  labs(x = "State") +
  labs(y = "Total number of victims") +
  scale_y_continuous(breaks = seq(0, 650, 50), limits = c(0, 650), expand = c(0, 0)) +
  scale_fill_manual(values = colours) +
  ggtitle("Victims of mass shootings per State")
