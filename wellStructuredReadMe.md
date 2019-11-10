## Proposal Rubric
---
This rubric is intended to help guide expectations and increase transparency. However, it is
not necessarily fully exhaustive. Make sure to read the detailed explanation on Moodle.

### Project set up (**2 points**)
- Successfully creates repository and adds all group members to the repo (**1 point**)
    - [repo](https://github.com/APoljakow/DataProcessesProjectGroup01.git)
    - [Jorge Martin Lasaosa](https://github.com/jomartla), [Juan Luis Ruiz-Tagle Oriol](https://github.com/juanluisrto), [Mateusz Klimas](https://github.com/MateuszKlimas), [Wladyslaw Eysymontt](https://github.com/weysymontt), [Artjom Poljakow](https://github.com/APoljakow) 
- Uses well formatted markdown throughout this document (headers for each section, lists where appropriate, hyperlinked words, etc.) (**1 point**)
    - [x] well formed

### Domain of Interest (**13 points**)
- Why are you interested in this field/domain? Describes in at least 2 - 3 sentences why the group is interested in this area. May be personal, or related to pertinence of the domain. (**1 point**)
 
    - This field is of interest since the deaths by gun misuse in USA supposes a thread of huge relevance and importance for the american society, with drastic implications in many areas of the life of the citizens. (e.g. safety, laws, finance...)
- Three examples of other data driven projects related to this domain (**6 points, 2 points each**)?
    - Provides link to the data driven projects (**1 point**)
        - [gun law navigator](https://everytownresearch.org/navigator/)
        - [Data Driven Analysis of Gun Type and Mass Shooting Deaths](https://fivethirtyeight.com/features/gun-deaths/)
        - [breaking the pattern](https://breaking-the-pattern.com/)
        - [mapping police violence](https://mappingpoliceviolence.org/cities)
    - Briefly describes the project in 1 - 2 sentences (**1 points**)
        - [gun law navigator description](https://gijn.org/2018/01/23/how-they-did-it-developing-a-data-driven-navigator-on-gun-laws/)
             - [two](https://www.wired.com/2016/10/one-great-way-reduce-gun-violence-whole-lot-data/)
             - [three](https://www.globenewswire.com/news-release/2019/10/03/1924891/0/en/Zignal-Labs-The-Public-Good-Projects-and-Everytown-for-Gun-Safety-Recognized-by-The-Holmes-Report-s-Innovator-25-Americas-2019.html)
             - The gun law navigator is a web application which provides the user information considering the current law applied on guns in america. Furthermore it provides the possibility to understand certain aspects and compare them through time and between certain states. 
        - [Data Driven Analysis of Gun Type and Mass Shooting Deaths description](https://www.bu.edu/bmegsc/2018/04/02/a-data-driven-analysis-of-gun-type-and-mass-shooting-deaths/)
        - [breaking the pattern description] **TODO** ()
        - [mapping police violence description](https://www.nature.com/articles/d41586-019-02601-9)
- Three data-driven questions do you hope to answer about this domain (**6 points, 2 points each**)
    - Question 1
        - Question is related to the field (**1 point**)
            - Are the mental ilnesses are more frequently observed among the mass shooters then among the population (population mean)?
        - Question can be answered with data (**1 point**)

    - Question 2
        - Question is related to the field (**1 point**)
            - Does the need of the Firearm Licence (in a concrete State) in order to purchase a gun affects the "gun kills/population" rate?
        - Question can be answered with data (**1 point**)

    - Question 3
        - Question is related to the field (**1 point**)
            - What variables affect the gun
        - Question can be answered with data **(1 point**)
### Finding Data (**15 points, 5 points each**)
For each identified data source, provide/complete the following:

- Link to URL where data is from (**1 point**)
    - [Federal Firearm Licences](https://www.kaggle.com/doj/federal-firearm-licensees)
         - [License CC0: Public Domain](https://creativecommons.org/publicdomain/zero/1.0/)

    - [Gun violence Dataset](https://www.kaggle.com/jameslko/gun-violence-data)
         - [License CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
         - [gun violence archive](https://www.gunviolencearchive.org/)
         - [Mission Statement](https://www.gunviolencearchive.org/about)

    - [US Mass Shootings](https://www.kaggle.com/zusmani/us-mass-shootings-last-50-years)
         - [License Database: Open Database, Contents: Database Contents](https://opendatacommons.org/licenses/dbcl/1.0/)

    - [Firearms Provisions in US States](https://www.kaggle.com/jboysen/state-firearms)
         - [License CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)

- Download the data into the project repo in a data/ folder (**1 point**)
    - [x] downloaded
- Description of how was the data collected or generated (**1 point**)
    - [ ] TODO
        - [Federal Firearm Licences](https://www.kaggle.com/doj/federal-firearm-licensees): We have found this dataset in [kaggle](https://www.kaggle.com/). This data is published online in a tab-separated format by the Department of Justice Bureau of Alcohol, Tobacco, Firearms, and Explosives. It has been lightly retouched into a CSV file before publication in Kaggle.
        - [Gun violence Dataset](https://www.kaggle.com/jameslko/gun-violence-data): We have found this dataset in [kaggle](https://www.kaggle.com/), but originally the date was downloaded from [Gun Violence Archive (GVA)](http://www.gunviolencearchive.org/).
        - [US Mass Shootings](https://www.kaggle.com/zusmani/us-mass-shootings-last-50-years): We have found this dataset in [kaggle](https://www.kaggle.com/). Several public datasets and web pages had been consulted to compile this data. Some of the major data sources include Wikipedia, Mother Jones, Stanford, USA Today and other web sources.
        - [Firearms Provisions in US States](https://www.kaggle.com/jboysen/state-firearms): We have found this dataset in [kaggle](https://www.kaggle.com/). The first 100 provisions are originally derived from Thomson Reuters Westlaw legislative database and had been coded by Michael Siegel, MD, MPH, Boston University School of Public Health and another 33 were coded using a database created by Everytown for Gun Safety and Legal Science, LLC.

- How many observations (rows) and features (columns) are in your data(**1 point**)?
    - [ ] TODO
        - [Federal Firearm Licences](https://www.kaggle.com/doj/federal-firearm-licensees):
            - Columns: 18
            - Rows: 80197
        - [Gun violence Dataset](https://www.kaggle.com/jameslko/gun-violence-data):
            - Columns: 29
            - Rows: 251590
        - [US Mass Shootings](https://www.kaggle.com/zusmani/us-mass-shootings-last-50-years):
            - Columns: 13
            - Rows: 325
        - [Firearms Provisions in US States](https://www.kaggle.com/jboysen/state-firearms):
            - Columns: 136
            - Rows: 1350
- What questions (from above) can be answered using the data in this dataset (**1 point**)?
    - [ ] TODO
        - All of them can be answered using the data from the selected datasets. The only one thing we will have to use apart from this, is some APIs in order to get the populational data, as number of people living in each State or percentage of people having concrete mental ilness in U.S.

