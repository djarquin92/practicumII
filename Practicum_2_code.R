library(caret) #Classification and Regression
library(readr) #library to read data
library(stats) #exacrute k means clustering analysis
library(dplyr)#data manipulation
library(ggplot2) #plot cluster plot and other vizualizations
library(ggfortify) #plot cluster plot
library(tree) #Decision Tree/Random Forest
library(randomForest) #Random Forest

#Read the data 
speed_dating <- read_csv("C:/Users/jarqu/Desktop/Practicum/speed_dating.csv")

#clean and wrangle the data, I split my initial subset (demographics) into 2 groupd and replaced all NULLs with zero or column average. Then bind them back together
df1_replace_null <- select(speed_dating,c(5:9,10,13,15,36,38:42,46:48,50))
df2_replace_avg <- select(speed_dating,c(34,45))
df1_replace_null[is.na(df1_replace_null)] <- 0
df2_replace_avg <- data.frame( sapply( df2_replace_avg, function(x) ifelse(is.na(x),mean(x, na.rm = TRUE), x)))
df <- cbind(df1_replace_null,df2_replace_avg)

#Within Cluster Sums of Squares Function and Plot
wssplot <- function(data, nc = 15, seed = 1234)
{ 
     wss <- (nrow(data) -1) *sum(apply(data,2,var))
     for ( i in 2:nc){
         set.seed(seed)
         wss[i] <- sum(kmeans(data, centers = i)$withinss)}
     plot(1:nc, wss, type = "b", xlab = "Number of Clusters",
          ylab = "within groups of sum of squares") }

View(df)
wssplot(df)

#K-means CLustering analysis
km1 <- kmeans(df, 4)
autoplot(km1, df, frame = TRUE)
km1$centers


#initial decision tree to use in our random forests, split data into train and test models and build models 
df$match <- as.factor(df$match)
set.seed(1234)
train <- sample(1:nrow(df),4189)
df.test <- df[-train,]
df.train <- df[train,]
tree.df <- tree(df.train$match ~ ., data = df.train)  
tree.pred = predict(tree.df, df.test, type = "class") 
treetable <- table(tree.pred, df.test$match)
confusionMatrix(treetable)


# Build RandomForest model and execute 
df.train$match <- as.factor(df.train$match)
rf_dating <- randomForest(match~., data = df.train, importance =TRUE)
rf_predict <- predict(rf_dating, newdata = df.test)
rf_table <- table(tree.pred, rf_predict)
confusionMatrix(rf_table)

#Variables of importance plot of our random forest models
varImpPlot(rf_dating)




#subset 2, inerests. 

#clean the data by only replacing nulls with zero (there were actually no nulls but just did to be safe)
interests <- select(speed_dating,c(13,51:67))
interests[is.na(interests)] <- 0

#split data subset into test and train for our model and execute random forest model, variable of importance plot.
interests.test <- interests[-train,]
interests.train <- interests[train,]
tree.interests <- tree(interests.train$match ~ ., data = interests.train)  
interests.pred = predict(tree.interests, interests.test, type = "vector")
rf_interests <- randomForest(match~., data = interests.train, importance =TRUE)
rf_interests_predict <- predict(rf_interests, newdata = interests.test)
rf_interests_table <- table(interests.pred, rf_interests_predict)
confusionMatrix(rf_interests_table)
varImpPlot(rf_interests)

#computer column means
interests_means <-apply(interests[,-1], 2, function(x) mean(x))
#plot the columns means 
par(las=1) 
blot <- barplot(interests_means, horiz=TRUE,  
                +               ylim = c(0, 20.0), xlim = c(0,8),  
                +               main="Common Interests Means", 
                +               names.arg = c("sports", "tv sports", "exercise", "dining", "museums", "art", "hiking", "gaming", "clubbing", "reading", "tv", "theater", "movies", "concerts", "music", "shopping", "yoga"),  
                +               col = c("#3232a8", "#a83248")) 

#now split interests subset data where match = 0 and match = 1, then find column means
interests_1 <- filter(interests, match == 1)
interests_0 <- filter(interests, match == 0)
interests_1_means <-apply(interests_1[,-1], 2, function(x) mean(x))
interests_0_means <-apply(interests_0[,-1], 2, function(x) mean(x))
graph1 <- rbind(interests_0_means, interests_1_means)
graph1
barplot(graph1, beside = T, ylim = c(0,50),xlim = c(0,10),main="Interests Differences", horiz = TRUE,fill = match,  col = c("#332f30", "#430ec9"))
legend("topright", inset=.02, title="Match vs No Match", c("Match","No Match"), fill=c("#430ec9", "#332f30"), horiz=TRUE, cex=0.8)





#Subset 3, Survey Responses

#clean data by replacing all NULLs with zeros and add survey columns together to find total sum for each of 6 categories, then bind them together with matches column
survey <- select(speed_dating,c(99:104,109:114, 123:128,135:146))
survey[is.na(survey)] <- 0
survey["attractive"] <- survey$attr + survey$attr1_s + survey$attr7_2 + survey$attr4_2 + survey$attr2_2
survey["sincere"] <- survey$sinc + survey$sinc1_s + survey$sinc7_2 + survey$sinc4_2 + survey$sinc2_2
survey["intelligent"] <- survey$intel + survey$intel1_s + survey$intel7_2 + survey$intel4_2 + survey$intel2_2
survey["ambitous"] <- survey$amb + survey$amb1_s + survey$amb7_2 + survey$amb4_2 + survey$amb2_2
survey["shared_interests"] <- survey$shar + survey$shar1_s + survey$shar7_2 + survey$shar4_2 + survey$shar2_2
survey["fun_total"] <- survey$shar + survey$shar1_s + survey$shar7_2 + survey$shar4_2 + survey$shar2_2
survey2 <- cbind(speed_dating$match, survey$attractive, survey$sincere, survey$intelligent, survey$fun_total, survey$ambitous, survey$shared_interests)
colnames(survey2) <- c("match", "attractive", "sincere", "intelligent", "fun", "ambitous", "shared_interests")
View(survey2)

##split data subset into test and train for our model and execute random forest model, variable of importance plot.
survey2 <- as.data.frame(survey2)
survey2$match <- as.factor(survey2)
survey.test <- survey2[-train,]
survey.train <- survey2[train,]
tree.survey <- tree(survey.train$match ~ ., data = survey.train)
survey.pred = predict(tree.survey, survey.test, type = "class")
rf_survey <- randomForest(match~., data = survey.train, importance =TRUE)
rf_survey_predict <- predict(rf_survey, newdata = survey.test)
rf_survey_table <- table(survey.pred, rf_survey_predict)
confusionMatrix(rf_survey_table)

#Compute column means for 6 attributes
survey_means <-apply(survey2[,-1], 2, function(x) mean(x))
 
#Plot the means
survey_means <-sort(survey_means)
survey_plot <- barplot(survey_means, horiz=TRUE,  
              +               ylim = c(0, 10.0), xlim = c(0,7),  
              +               main="Common Interests Means", 
              +               names.arg = c("fun", "shared_interests", "attractive", "ambitous", "sincer", "intelligent"),  
              +               col = c("#9b42f5", "#f5e342"))


#Now to look at survey results for when match = 0 and match = 1
survey3_1 <- filter(survey2, match == 1)
survey3_0 <- filter(survey2, match == 0)
survey_0_means <-apply(survey3_0[,-1], 2, function(x) mean(x))
survey_1_means <-apply(survey3_1[,-1], 2, function(x) mean(x))
graph2 <- rbind(survey_0_means, survey_1_means)
graph2
barplot(graph2, beside = T, ylim = c(0,8),main="Survey Responses Differences", fill = match,  col = c("#332f30", "#ff0048"))
legend("topright", inset=.02, title="Match vs No Match", c("Match","No Match"), fill=c("#ff0048", "#332f30"), horiz=TRUE, cex=0.8)





