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

-  Readme.md
-	CodeBook.md
-	run_analysis.R script
-	UCI HAR Dataset directory

##Directions

* Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into a folder on your local drive, say C:/Coursera/Documents/R/
* Make sure following packages are installed and Library's loaded:
* install.packages("httr")
library("httr", lib.loc="~/R/win-library/3.1")
install.packages("plyr")
library("plyr", lib.loc="~/R/win-library/3.1")
install.packages("rRcurl")
library("RCurl", lib.loc="~/R/win-library/3.1")
install.packages("tidy")
library("tidyr", lib.loc="~/R/win-library/3.1")

* Put run_analysis.R into c:/Cousera/UCI HAR Dataset/

* In RStudio: setwd("C:/Cousera/UCI HAR Dataset/”), followed by: source("run_analysis.R") - Final step of script will create final text file - data_set_with_the_averages.txt -  

* Use data <- read.table("data_set_with_the_averages.txt") to read the data in Rstudio. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 *6 =180 rows. 
