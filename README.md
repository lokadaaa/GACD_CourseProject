#Getting and Cleaning Data Final Project  

run.analysis.R script  

January 2017  
L. Okada


This script is for analysis of the data collected from the accelerometers from the Samsung Galaxy S 
smartphone. The full data set may be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

Prior to analysis, the working directory should be set to the unzipped data folder

The script performs the following operations:
- Reads in data, variable names, subject names, and activity labels for the training and test data
- Associates variable, subject, and descriptive activity names with the appropriate data
- Merges the test and training data sets
- Extracts only the variables for mean and standard deviation for the data set
- Creates a second data set containing the average of each variable by activity and subject
- Writes out this second data set to a text file named "GettingAndCleaningData_FinalProject_TidyData.txt"

Descriptions of variables can be found in "CodeBook.Md"