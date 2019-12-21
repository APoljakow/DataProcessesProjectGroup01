library(tibble)
library(stringr)
library(dplyr)
library(knitr)
library(leaflet)

gun <- as.tibble(data.table::fread(str_c("", "../data/gun-violence-data_01-2013_03-2018.csv"),
                                   header=TRUE,stringsAsFactors = FALSE, na.strings=c("NA", "")))
gun$victims <- gun$n_killed + gun$n_injured

allIncidents <- gun %>% select(incident_id, date, n_killed, n_injured, victims, location_description, city_or_county, state, latitude, longitude) %>% 
  rename(Incident_Id=incident_id, Date=date, Killed=n_killed, Injured=n_injured, Victims=victims, Location=location_description, City=city_or_county) %>%
  arrange(desc(Victims)) 

kable(allIncidents %>% select(-longitude, -latitude))

TopMap <- allIncidents %>% select(latitude, longitude, Victims, City, Location)

labels <- paste0("<strong>City: </strong>", TopMap$City, 
                 "<br><strong>Location: </strong>", TopMap$Location,
                 "<br><strong>Victims </strong>", TopMap$Victims) %>% lapply(htmltools::HTML)

leaflet(TopMap) %>%
  setView(lng=-96, lat=37.8, zoom=4) %>%
  addTiles() %>%
  addProviderTiles("CartoDB.Positron", group="Light map") %>%
  addScaleBar %>%
  addMarkers(~longitude, ~latitude,
             label = labels,  
             clusterOptions = markerClusterOptions())
