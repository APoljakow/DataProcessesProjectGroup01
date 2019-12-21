library(rstudioapi)
library(usmap)
library(dplyr)
library(plotly)
library(ggplot2)

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
license_map <- plot_usmap(data = licensesByState, values = "licenses", color = "blue") +
  scale_fill_continuous(name = "Number of gun selling licenses", label = scales::comma, low="green", high="red") + 
  theme(legend.position = "right") +
  labs(title = "USA heatmap ")

license_map
