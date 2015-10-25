# Coursera Getting and Cleaning Data Course Project

This is the repository for R code and documentation files written for the Coursera Getting and Cleaning Data Course Project by Gregorio Ambrosio Cestero.

## Overview

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The data for the project is [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

## Project summary
To create one R script called run_analysis.R that does the following:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Files 
### run_analysis.R
`run_analysis.R` contains all the code to perform the previous steps. Previously to run it, you need to decompress the zip file in the same directory as the script.

### CodeBook.md
`CodeBook.md` describes the variables, the data, and any transformations or work performed to clean up the data 

### TidyDataSet.txt
`TidyDataSet.txt`  is the tidy data set with the average of each variable for each activity and each subject.
