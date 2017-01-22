## Getting and Cleaning Data Course Project
## Coursera Data Science Specialization
## 
## L.Okada Jan 2017
##

# Prior to running, set working directory to folder containing "UCI HAR Dataset"

library(dplyr)
library(reshape2)

# Read in data, subject and activity label info, and variables for each data set
features <- read.table(".\\features.txt")                  # variable names
datTest <- read.table(".\\test\\X_test.txt")               # test data
subjectsTest <- read.table(".\\test\\subject_test.txt")    # test subjects
labelsTest <- read.table(".\\test\\y_test.txt")            # test activities
datTrain <- read.table(".\\train\\X_train.txt")            # training data
subjectsTrain <- read.table(".\\train\\subject_train.txt") # training subjects
labelsTrain <- read.table(".\\train\\y_train.txt")         # training activities

# Associate variable names and subject and activity labels with each data set
names(datTrain) <- features[,2]
names(datTest) <- features[,2]
datTest$subject <- subjectsTest[,1]
datTest$label <- labelsTest[,1]
datTrain$subject <- subjectsTrain[,1]
datTrain$label <- labelsTrain[,1]

# Merge training and data sets to create one dataset
mergedData <- rbind(datTest,datTrain)

# Extract only mean and sd variables by pattern matching of variable names
meanandsdcols <- grep("mean|std",names(mergedData))      
meanFreqcols <- grep("meanFreq",names(mergedData))   
meancols <- setdiff(meanandsdcols,meanFreqcols)  # Do not select meanFreq columns
subjectandlabelcols <- which(names(mergedData) %in% c("subject","label"))
MeanSDSubset <- mergedData[,c(subjectandlabelcols,meanandsdcols)]  


# Assign descriptive activity names to the activities in the data set
activitylabels <- read.table(".\\activity_labels.txt",stringsAsFactors = FALSE)
MeanSDSubset <- tbl_df(MeanSDSubset)
MeanSDSubset <- mutate(MeanSDSubset, activity=character(nrow(MeanSDSubset))) %>%
        mutate(activity=ifelse(label==1,activitylabels[1,2],activity)) %>%
        mutate(activity=ifelse(label==2,activitylabels[2,2],activity)) %>%
        mutate(activity=ifelse(label==3,activitylabels[3,2],activity)) %>%
        mutate(activity=ifelse(label==4,activitylabels[4,2],activity)) %>%
        mutate(activity=ifelse(label==5,activitylabels[5,2],activity)) %>%
        mutate(activity=ifelse(label==6,activitylabels[6,2],activity))
meanandsdcols <- grep("mean()|std()",names(MeanSDSubset))
subjectandlabelcols <- which(names(MeanSDSubset) %in% c("subject","activity"))
MeanSDSubset <- MeanSDSubset[,c(subjectandlabelcols,meanandsdcols)]

# Create a second, independent tidy data set (called datMeans) with the average 
# of each variable for each activity and each subject.
measurementVariables <- names(MeanSDSubset)[-(1:2)]
datMelt <- melt(MeanSDSubset,id=c("subject","activity"),
                measure.vars=measurementVariables)
datMeans <- dcast(datMelt,subject+activity~variable,mean)

# Write out .txt file of final clean data set
write.table(datMeans,"GettingAndCleaningData_FinalProject_TidyData.txt",
            row.names = FALSE)
