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
        - [Gun law navigator](https://everytownresearch.org/navigator/)
        - [Data driven analysis of gun type and mass shooting deaths](https://fivethirtyeight.com/features/gun-deaths/)
        - [Breaking the pattern](https://breaking-the-pattern.com/)
        - [Mapping police violence](https://mappingpoliceviolence.org/cities)
    - Briefly describes the project in 1 - 2 sentences (**1 points**)
        - The **gun law navigator** is a web application which provides the user information considering the current law applied on guns in america. Furthermore it provides the possibility to understand certain aspects and compare them through time and between certain states. Here we can see some insights about the project:
            - [How they did it?](https://gijn.org/2018/01/23/how-they-did-it-developing-a-data-driven-navigator-on-gun-laws/)
            - [One way to reduce gun violence through data](https://www.wired.com/2016/10/one-great-way-reduce-gun-violence-whole-lot-data/)
            - [About the lab which developed the navigator](https://www.globenewswire.com/news-release/2019/10/03/1924891/0/en/Zignal-Labs-The-Public-Good-Projects-and-Everytown-for-Gun-Safety-Recognized-by-The-Holmes-Report-s-Innovator-25-Americas-2019.html)     
        - The **analysis of gun type and mass shooting deaths**  uses data from the years 2012 to 2014 about different categories of deaths caused by guns. Some examples of these categories are terrorism gun deaths, homicides or mass shootings. A summary of this analysis could be seen in the following link:
            - [Summary of the analysis](https://www.bu.edu/bmegsc/2018/04/02/a-data-driven-analysis-of-gun-type-and-mass-shooting-deaths/)
        - **Breaking the pattern** proposes to paint with data as an alternative way of understanding the issue of gun violence. Offering a deeper understanding of gun violence in American cities as a public health phenomenon, rather than a public safety issue. 
        - The **mapping violence police** use data from January 2013 through December 2018 to show which police departments are most - and least - likely to kill people. Some conclusions can be seen in this article:
            - [Article understanding the results](https://www.nature.com/articles/d41586-019-02601-9)
        
- Three data-driven questions do you hope to answer about this domain (**6 points, 2 points each**)
    - Question 1
        - Question is related to the field (**1 point**)

            Does the type of license have any effect on the number of killed or injured people (states with licenses that allow more powerful weapons maybe have bigger number of dead people than injured ones; meanwhile states with licenses that allow less dangerous weapons lead to gun violence cases with less dead people and more injured people).
        - Question can be answered with data (**1 point**)

            Considering the data available it should be possible to answer by combining datasets.

    - Question 2
        - Question is related to the field (**1 point**)
           
            Does the need of a Firearm Licence (in a concrete State) in order to purchase a gun affects the "gun kills/population" rate?
        - Question can be answered with data (**1 point**)

            The question can be answered by combining the knowledge from the federal firearm license dataset and the gun violence dataset. Furthermore the gun law navigator can be used to compare firearm provisions in states dataset.
    - Question 3
        - Question is related to the field (**1 point**)
          
            How does the gun violence influence the gross domestic product in USA. For example taxes, hospitals, income.
        - Question can be answered with data **(1 point**)
	
		Given datasets can provide a contribution to the answers but certainly lack information which needs to be gained from other resources.
	    
    - Question 4
        - Question is related to the field: 
          
            How is the guntype distribution across the different states? 
        - Question can be answered with data

            Dependend on the dataset provided we can answer this question.


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
    - [x] Downloaded
	
- Description of how was the data collected or generated (**1 point**)

    All of the following datasets have been found in [Kaggle](https://www.kaggle.com), but are gathered from different sources:

    - [Federal Firearm Licences](https://www.kaggle.com/doj/federal-firearm-licensees): The original data is published online in a tab-separated format by the [Department of Justice Bureau of Alcohol, Tobacco, Firearms, and Explosives](https://www.atf.gov/resource-center/data-statistics). This association, also known as ATF as, compiles a comprehensive collection of ATF-related data from national surveys, state-based surveys, other collected license statistics, and other data sources documents trends in firearms, commerce and use of federal services in the United States.
    - [Gun violence Dataset](https://www.kaggle.com/jameslko/gun-violence-data): The original data source is [Gun Violence Archive (GVA)](http://www.gunviolencearchive.org/). GVA began with the goal to provide a database of incidents of gun violence and gun crime. To that end they utilize automated queries, manual research through over 6,500 sources from local and state police, media, data aggregates, government and other sources daily. Each incident is verified by both initial researchers and secondary validation processes. Links to each incident are included in the incident report to provide further information on each incident for researchers, advocate groups, media and legislative interests. The incident reports provide a starting point for researchers, media and legislative interests to add texture to our raw data.
    - [US Mass Shootings](https://www.kaggle.com/zusmani/us-mass-shootings-last-50-years): The data is gathered from several public datasets and web pages that had been consulted. Some of the major data sources include Wikipedia, Mother Jones, Stanford, USA Today and other web sources.
    - [Firearms Provisions in US States](https://www.kaggle.com/jboysen/state-firearms): The first 100 provisions are originally derived from Thomson Reuters Westlaw legislative database and had been coded by Michael Siegel, MD, MPH, Boston University School of Public Health and another 33 were coded using a database created by Everytown for Gun Safety and Legal Science, LLC.

- How many observations (rows) and features (columns) are in your data(**1 point**)?
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
    - All of them can be answered using the data from the selected datasets. The only one thing we will have to use apart from this, is some APIs in order to get the populational data, as number of people living in each State or percentage of people having concrete mental ilness in U.S.

