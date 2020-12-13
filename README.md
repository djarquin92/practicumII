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

Once I had the demographics subset data all cleaned up and sorted out I did some machine learning and analytics

I started with K means clustering to get a better insight of what the machine grouped together from different columns

I then did the Random Forest method to see how well the machine can predict when there are matches

I then did a Variable Importance Plot from the Random Forest to see which dependent variables influenced the machine decision making

# Demographics Data Results

Our Random Forest Model achieved an accuracy of 94.99%

Here are the results of the Variable of Importance Plot

These lists the variables of most importance to our machine learning random forests on the left

We can see that wave number, age and round played a huge part of our model

The chart on the right measure how much a variable impacts the gini index of our data

# Interests Data

The next subset of data I looked at closely were the interests listed by each of the participants

The participants were given a list of 17 activities and rate on a scale of 1-10 how much they enjoy the activity

I was curious to see if certain activities drew people together more than others

# Interests Data Results

I performed a random forests and variable of importance plot to see which variables impacted our model the most

Our model yielded a 96.9% accuracy

We can see that the mean of our model is mostly impacted by clubbing, theater, reading and tv

I was curious to see what the individual means were for each of the categories

I first looked at total mean with matches and non matches, then I split the data and measured the means again

We can see that the most popular interests in the set of people are yoga, shopping, music and concerts.

Now when we split of the data based off of whether there was  a match or not, we can spot a couple things

Interests between matches and non matches line up almost perfectly. 

Our 2 subset groups have a lot of the same interests 

# Survey Responses 

Each of the participants were asked to rate their dates on 6 attributes

Participants had to fill out these answers if there was a match or not

I believe we can get some great insights to see what attributes stood out the most

Keep in mind that each of these dates were only 4 minutes and participants were asked to rate their date on these 6 attributes on a  scale from 1-10

# Survey Responses Results

Our Random Forest Model yielded a 97.11% accuracy

I believe that this subset of data was the most telling of when instanced were matches

We can get a true insight of what people were looking for in choosing a partner.

Based off our Random Forest model, ambitiousness and attractiveness were consistently the 2 most impactful independent variables in determining our results for a match

Similarly to how we observed interests, I wanted to look at the total means of matches and non matches. 

Here we can see that intelligence and sincere were generally rated the highest among all participants for their date

Common interests and fun were rated the lowest.

Now we can split the data and see what the differences are and how much impact it had on total means

Here are the means split up in cases where there are match vs no match

Couple insights we can clearly make are that matches were rated higher in all categories, clearly

The biggest take away to me is that how fun their date was and shared interests show the largest difference, and those 2 same columns were the lowest when we looked at all data in the last slide

# Conculsion

There are many things to consider when analyzing our dataset on determining cases of matches or non matches

Demographics and survey results proved to be the most impactful

We were able to observe which independent variables were most impactful to our machine learning model

Observing the data as a whole helped us get better insights before splitting it into our match vs nonmatch

# References

- “Speed Dating Experiment - Dataset by Annavmontoya.” Data.world, 16 Aug. 2016, data.world/annavmontoya/speed-dating-experiment/workspace/project-summary?agentid=annavmontoya. 

- robk@statmethods.net, Robert Kabacoff -. “Bar Plots.” Quick-R: Bar Plots, www.statmethods.net/graphs/bar.html. 

- David. “How to Clean Messy Data in R.” R For the Rest of Us, 10 Dec. 2019, rfortherestofus.com/2019/12/how-to-clean-messy-data-in-r/. 



