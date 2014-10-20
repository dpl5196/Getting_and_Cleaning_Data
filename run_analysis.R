# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#download and unzip to directory file to "D:/Cousera/UCI HAR Dataset" and setWD() to same. make sure following packages and Library's are installed: Httr, plyr, Rcurl, tidyr.


install.packages("httr")
library("httr", lib.loc="~/R/win-library/3.1")
install.packages("plyr")
library("plyr", lib.loc="~/R/win-library/3.1")
install.packages("rRcurl")
library("RCurl", lib.loc="~/R/win-library/3.1")
install.packages("tidy")
library("tidyr", lib.loc="~/R/win-library/3.1")

setwd("D:/Cousera/UCI HAR Dataset")
# This R script does the following:

# 1. Merges the training and the test sets to create one data set.

traindt <- read.table("train/X_train.txt")
testdt <- read.table("test/X_test.txt")
X <- rbind(traindt, testdt)

traindtd1 <- read.table("train/subject_train.txt")
testtd1 <- read.table("test/subject_test.txt")
Subdt <- rbind(traindtd1, testtd1)

traindtd2 <- read.table("train/y_train.txt")
testtd2 <- read.table("test/y_test.txt")
Y <- rbind(traindtd2, testtd2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("features.txt")
featureindices <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, featureindices]
#### Set column heads of X to match features
names(X) <- features[featureindices, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


# 3. Uses descriptive activity names to name the activities in the data set.
activitiesdt <- read.table("activity_labels.txt")
## replace _ and change to lower case
activitiesdt[, 2] = gsub("_", "", tolower(as.character(activitiesdt[, 2])))
Y[,1] = activitiesdt[Y[,1], 2]

## name column in Y descriptively
names(Y) <- "activity"
## Step 4 and 5: Add descriptive label names and creates new data set
names(Subdt) <- "subject"
cleantraintest <- cbind(Subdt, Y, X)
write.table(cleantraintest, "tidy_data.txt")
uniqsubjects = unique(Subdt)[,1]
numbersubjects = length(unique(Subdt)[,1])
numberactivities = length(activitiesdt[,1])
numbercols = dim(cleantraintest)[2]
final = cleantraintest[1:(numbersubjects*numberactivities), ]
count = 1 
for (c2 in 1:numbersubjects) { 
  for (c3 in 1:numberactivities) { 
    final[count, 1] = uniqsubjects[c2] 
    final[count, 2] = activitiesdt[c3, 2] 
    tmp <- cleantraintest[cleantraintest$subject==c2 & cleantraintest$activity==activitiesdt[c3, 2], ] 
    final[count, 3:numbercols] <- colMeans(tmp[, 3:numbercols]) 
    count = count+1 
  } 
} 
write.table(final, "data_with_the_averages.txt", row.name=FALSE)

