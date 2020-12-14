# Data and Psychology of Dating

Devon Jarquin

Masters of Science, Data Science Candidate 

Regis Uiversity 

Practicum II 

December, 2020 

# Purpose

The purpose of this practicum is to use machine learning and analytics to get a better understanding if there’s any links between the demographics, psychology and if there was a connection between the participants.
I would like to gain as much insight as possible from the data provided. We will be looking specifically at demographics, interests of the participantsand survey responses to their date in how they rated them.

# Method

- First step in getting insights ffrom our data is to clean it and prepare it to be analyzed.
- Second step is break the data into appropriate groups to make our analyzing as efficient as possible. 
- Third, once we have our data cleaned and grouped, then we can begin our machine learning methods and analyzing
  - K means Clustering
  - Random Forests
  - Data Visualization 
- Lastly we can draw out insights and conclusion 

# Data Overview
I will be using data found: https://data.world/annavmontoya/speed-dating-experiment/workspace/file?filename=Speed+Dating+Data.csv
The data was gathered from speed dating participants from 2002-2004, during which they had four minutes to interact with someone of the opposite gender, location was not disclosed 
The data contains:
  - Demographics such as occupation, race, age, university attended, wave of date and more. 
  - How they rank 17 activities pertaining to personal interests such as sports, music, hiking, and so on. 
  - As well as how they ranked each of their speed dating partners in terms of: attractiveness, sincerity, intelligence, how fun they appeared to be, ambitiousness, and shared interests.
 
 # Data Cleaning and wrangling 
I broke up the data into 3 main groups, briefly mentioned before and I will be analyzing them in similar ways
The 3 groups are as follows
  - Demographics
  - Interests 
  - Survey Responses to each date
I also cleaned the data by inserting either zeros or column averages since there were many NULL values

# Demographics Data

Once I had the demographics subset data all cleaned up and sorted out I did some machine learning and analytics.
I started with K means clustering to get a better insight of what the machine grouped together from different columns.
I then did the Random Forest method to see how well the machine can predict when there are matches
Lastly, I did a Variable Importance Plot from the Random Forest to see which independent variables influenced the machine decision making.

# Demographics Data Results

![](https://github.com/djarquin92/practicumII/blob/main/WSS_Plot.png)
![](https://github.com/djarquin92/practicumII/blob/main/Kmeans_clustering.png)
![](https://github.com/djarquin92/practicumII/blob/main/Random_forest_1.png)

- Our Random Forest Model achieved an accuracy of 94.99%
- We can see that wave number, age and round are the independent variables that played a huge part of our random forest model.
- The chart on the right measure how much each independednt variable impacts the gini index of our data

# Interests Data

The next subset of data I looked at closely were the interests listed by each of the participants.
The participants were given a list of 17 activities and rate on a scale of 1-10 how much they enjoy the activity.
I was curious to see if certain activities drew people together more than others.

# Interests Data Results

![](https://github.com/djarquin92/practicumII/blob/main/Random_forest_2_interests.png)
![](https://github.com/djarquin92/practicumII/blob/main/Var_imp_1.png)
- I performed a random forests and variable of importance plot to see which variables impacted our model the most
- Our model yielded a 96.9% accuracy
- We can see that the mean of our model is mostly impacted by clubbing, theater, reading and tv

# Interest Data Visualizations 

![](https://github.com/djarquin92/practicumII/blob/main/barplot_1_total_interests.png)
![](https://github.com/djarquin92/practicumII/blob/main/Barplot_2_interests.PNG)
The Bar Plots show the mean of each of the categories for interests. 
I first looked at total mean with matches and non matches, then I split the data and measured the means again
We can see that the most popular interests in the set of people are yoga, shopping, music and concerts.
Once we split of the data based off of whether there were matches or not, we can spot a couple things
  - Interests between matches and non matches line up almost perfectly. 
  - Our 2 subset groups have a lot of the same interests 

# Survey Responses 

Each of the participants were asked to rate their dates on 6 attributes on a scale from 1 to 10.
Participants had to fill out these answers even if there was a match or not.
I believe we can get some great insights to see what attributes stood out the most
Keep in mind that each of these dates were only 4 minutes and participants were asked to rate their date on these 6 attributes on a  scale from 1-10

# Survey Responses Results

![](https://github.com/djarquin92/practicumII/blob/main/random_forest_3_survey_reponses.png)
![](https://github.com/djarquin92/practicumII/blob/main/Var_imp_3_survey_responses.png)
Our Random Forest Model yielded a 97.11% accuracy
Based off our Random Forest model, ambitiousness and attractiveness were consistently the 2 most impactful independent variables in determining our results for a match.
We can get a true insight of what people were looking for in determining if their date would be a match.

# Survey Response Data Visualizations 
![](https://github.com/djarquin92/practicumII/blob/main/barplot_3_survey_responses.png)
![](https://github.com/djarquin92/practicumII/blob/main/barplot_4_survey_responses.PNG)

The Bar plots show the means of each of the categories for the participants responses to their date.
In the bar chart with both match and non match we should note a couple things:
  - intelligence and sincere were generally rated the highest among all participants for their date
  - Common interests and fun were rated the lowest.
Once we split the data we can see how the differences are impacted.
There are a couple interesting insights we can make:
  - matches are clearly rated higher in all categories
  - But The biggest take away to me is that how fun their dates were and shared interests show the largest difference, and those 2 same columns were the lowest when we looked at all data in the last slide

# Conculsion

There are many things we observed when analyzing our dataset on determining cases of matches or non matches
  - Demographics and survey results proved to be the most impactful
  - We were able to observe which independent variables were most impactful to our machine learning model
  - Observing the data as a whole helped us get better insights before splitting it into our match vs nonmatch

# References

- “Speed Dating Experiment - Dataset by Annavmontoya.” Data.world, 16 Aug. 2016, data.world/annavmontoya/speed-dating-experiment/workspace/project-summary?agentid=annavmontoya. 

- robk@statmethods.net, Robert Kabacoff -. “Bar Plots.” Quick-R: Bar Plots, www.statmethods.net/graphs/bar.html. 

- David. “How to Clean Messy Data in R.” R For the Rest of Us, 10 Dec. 2019, rfortherestofus.com/2019/12/how-to-clean-messy-data-in-r/. 



