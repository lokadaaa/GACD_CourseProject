#Codebook for run_analysis.R
  
##Data Description
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.  
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.  
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz.  
  
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag).  
  
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).  
  
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.  
  
tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  
fBodyAccMag  
fBodyAccJerkMag  
fBodyGyroMag  
fBodyGyroJerkMag  
  
The set of variables that were estimated from these signals are:  
  
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range  
entropy(): Signal entropy 
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal  
kurtosis(): kurtosis of the frequency domain signal  
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  
  
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:  
  
gravityMean  
tBodyAccMean  
tBodyAccJerkMean  
tBodyGyroMean  
tBodyGyroJerkMean  
  
The six activities included for which these variables were measured are:  
1. WALKING

2. WALKING_UPSTAIRS

3. WALKING_DOWNSTAIRS

4. SITTING

5. STANDING 
6. LAYING

  
There are 30 subjects (numbered 1-30) for which data was measured  
  
##Data Files  
Data files:  
- X_test.txt		(measurement data for the test set)  
- X_train.txt		(measurement data for the training set)  
  
Variable files:  
- features.txt		(List of all measurement variables)  
- activity_labels.txt 	(Activity descriptions corresponding to each activity label)  
- y_test.txt		(activity labels for the test set)  
- y_train.txt 		(activity lables for the training set)  
  
##Analysis  
The script performs the following operations:  
- Reads in data, variable names, subject names, and activity labels for the training and test data  
- Associates variable, subject, and descriptive activity names with the appropriate data  
- Merges the test and training data sets  
- Extracts only the variables for mean and standard deviation for the data set  
- Creates a second data set containing the average of each variable by activity and subject  
- Writes out this second data set to a text file named "GettingAndCleaningData_FinalProject_TidyData.txt"  
  
##Computed Variables (Analysis script)  
Only the mean() and std() variables for each feature from the original data were used in the analysis (66 variables total)
The output dataset contains the mean of the column variable for the patient and activity specified by the row