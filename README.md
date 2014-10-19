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

* Put run_analysis.R into c:/Cousera/UCI HAR Dataset/

* In RStudio: setwd("C:/Cousera/UCI HAR Dataset/”), followed by: source("run_analysis.R")

* Use data <- read.table("data_set_with_the_averages.txt") to read the data. It is 180x68 because there are 30 subjects and 6 activities, thus "for each activity and each subject" means 30 *6 =180 rows. 
