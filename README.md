---
title: "Getting and Cleaning Data"
author: "Dawn LaComb"
date: "Saturday, October 18, 2014"
output: html_document
---

This is a repository for code and documentation written for the Getting and Cleaning Data Course Project "https://class.coursera.org/getdata-008/human_grading/view/courses/972586/assessments/3/submissions" offered through Johns Hopkins University.

## Course Project
(find all project-related materials in the UCI HAR Dataset directory, however, copies of the important files have been put into this main directory to fulfill the submission requirement)
Documents include:

- Readme.md
-	CodeBook.md
-	run_analysis.R script
-	data_with_the_averages.txt

##Directions

Part 1 - Prep work
* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:/Coursera/UCI HAR Dataset/
    (this will make it easy to run the script below.)
* Put run_analysis.R into the same directory  c:/Cousera/UCI HAR Dataset

*In RStudio make sure the following packages are installed and loaded:
>install.packages("httr") library("httr", lib.loc="~/R/win-library/3.1") 
>install.packages("plyr") library("plyr", lib.loc="~/R/win-library/3.1") 
>install.packages("rRcurl") library("RCurl", lib.loc="~/R/win-library/3.1") 
>install.packages("tidy") library("tidyr", lib.loc="~/R/win-library/3.1")

Part 2 - Running of Script 

* In RStudio: 
> setwd("c:/Cousera/UCI HAR Dataset/
> source("run_analysis.R")

* Final line of code will write to table a txt.file - The text file is not pretty to the human eye. To see pretty data set a variable equal to the text file in R using a statement like:
data <- read.table("data_with_the_averages.txt" , header=TRUE) 
view(data)
It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 *6-180 rows



Explanation of what scripts does
This script does the following: 

Step 1 - Merges the training and the test sets to create one data set.

It reads these datasets and has the following observations and variables
•  X_train.txt 7352 observations of 561 variables v1, v2, v3…. 
•	X_test.txt 2947 observations of 561 variables v1, v2, v3… 
•	subject_train.txt 7352 observations of 1 variable v1 
•	subject_test.txt 2947 observations of 1 variable v1 
•	y_train.txt 7352 observations of 1 variable v1 
•	y_test.txt 2947 observations of 1 variable v1
•	features.txt 561 observations of 2 variables v1, v2 where v2 includes mean and STD 
•	activity_labels.txt 6 observations of 2 variables v1, v2
Since the data are in rows, Step 1 of the script uses the read.table command to read these text files and combine the using the rbind function:
•	it reads the data from X_train.txt and X_test.txt into a variable X using rbind; merges the data  whereas X has 10299 observations of 561 variables
•	then reads the data from subject_train.txt and subject_test.txt into a variable Subdt using rbind; merges the data  whereas  Subdt 10299 observations of 1 variable
•	then reads data from y_train.txt and y_test.txt into a variable Y using rbind; merges the data  whereas y 10299 observations of 1 variable
Step 2, Extracts only the measurements on the mean and standard deviation for each measurement. 

It then extracts the list of rows in the features data set to just those called for in the instructions, which are the Mean or STD measurements, we do this using the grep command. This makes it more manageable. 
The script then then subsets the X dataset based on that list of rows with mean and STD and sets the names to lower case using gsub command (is a good practice to get into.) This results in the data set X being cut down to 10299 observations of 66 variables.
Sample of X column headings after subset tbodyacc-mean-x tbodyacc-mean-y tbodyacc-mean-z tbodyacc-std-x tbodyacc-std-y

Step 3 Uses descriptive activity names to name the activities in the data set
The script next reads activity labels from activity_labels.txt and then applies, lower case to those activity labels and replaces these lower case activity labels in the names of the merged Y data set to give Y descriptive activity names using the gsub command. I used the descriptive labels that were provided as the labels by the originators of the source data, since they are readable by the human eye and since they fit the definition of good row names (no space, no dots, no underscores and no parens)
V1 V2
1 1 walking 2 2 walkingupstairs 3 3 walkingdownstairs 4 4 sitting 5 5 standing 6 6 laying

Steps 4 Appropriately labels the data set with descriptive variable names. 
Call out the creation of a new data set and add the descriptive label names and then write the TXT file tidy_data_.txt using the write.table command. The script then removes _and other () using the gsub command since the names of variables should be lowercase, descriptive, not duplicative, free from _ underscore, free from dot, and free from white space. 

Step 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
The script then merges all the data into a final data set that is saved as data_with_the_averages.txt. Final observations of 180 variables 68
Sample of first few column headings of final file data_with_the_averages.txt subject activity tbodyacc-mean-x tbodyacc-mean-y tbodyacc-mean-z tbodyacc-std-x .  I left these headers for 2 reasons - 1) they do not violate the rules for headers since they do not contain space, dots, underscores, or parenthesis and 2) the source data did not give translations beyond the text provided. For this class project did not see the need to pretty up the names further. As stated above text files are not always pretty.  To see pretty data set a variable equal to the text file in R using a statement like:  data <- read.table("data_with_the_averages.txt ", header=TRUE)
