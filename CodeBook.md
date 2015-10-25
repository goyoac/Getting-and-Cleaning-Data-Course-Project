# Codebook for Coursera Getting and Cleaning Data Course Project
By Gregorio Ambrosio Cestero

## Description
This code book describes the variables, the data, and transformations to clean up the data 

## Source
The data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data set information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded Accelerometer and gyroscope, we captured 3-axial linear Acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (Accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor Acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body Acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

### Attribute Information:
For each record in the UCI HAR Dataset is provided: 
* Triaxial Acceleration from the Accelerometer (total Acceleration) and the estimated body Acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

##Transformations
### 1. Merges the training and the test sets to create one data set.
X,y, and subject train and test sets are read and joined through `rbind`
### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
features are read to extract through `grep` the measurements on the mean and standard deviation 
### 3. Uses descriptive activity names to name the activities in the data set
activity labels are read to name the activities in y
### 4. Appropriately labels the data set with descriptive variable names. 
column names are changed for clarity with the following:
* remove "()"
* subs "mean" by "Mean"
* subs "std" by "StdDev"
* remove "-" 
* subs "t" by "time"
* subs "f" by "freq"
* let only one "Body"

Also "activity" and "subject" are added.

The first tidy data set is built joining X, subject and y

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
`ddply(TidyDataSet1st, .(activity, subject), function(x) colMeans(x[, 1:66]))` is applied to the step 4 data set

## Variable Descriptions in the final tidy data set

| Variable | Description
-----------|-------------
| activity | The activity performed
| subject | Subject id
| timeBodyAccMeanX | Mean time for Acceleration of body for X direction
| timeBodyAccMeanY | Mean time for Acceleration of body for Y direction
| timeBodyAccMeanZ | Mean time for Acceleration of body for Z direction
| timeBodyAccStdDevX | Standard deviation of time for Acceleration of body for X direction
| timeBodyAccStdDevY | Standard deviation of time for Acceleration of body for Y direction
| timeBodyAccStdDevZ | Standard deviation of time for Acceleration of body for Z direction
| timeGravityAccMeanX | Mean time of Acceleration of gravity for X direction
| timeGravityAccMeanY | Mean time of Acceleration of gravity for Y direction
| timeGravityAccMeanZ | Mean time of Acceleration of gravity for Z direction
| timeGravityAccStdDevX | Standard deviation of time of Acceleration of gravity for X direction
| timeGravityAccStdDevY | Standard deviation of time of Acceleration of gravity for Y direction
| timeGravityAccStdDevZ | Standard deviation of time of Acceleration of gravity for Z direction
| timeBodyAccJerkMeanX | Mean time of body Acceleration jerk for X direction
| timeBodyAccJerkMeanY | Mean time of body Acceleration jerk for Y direction
| timeBodyAccJerkMeanZ | Mean time of body Acceleration jerk for Z direction
| timeBodyAccJerkStdDevX | Standard deviation of time of body Acceleration jerk for X direction
| timeBodyAccJerkStdDevY | Standard deviation of time of body Acceleration jerk for Y direction
| timeBodyAccJerkStdDevZ | Standard deviation of time of body Acceleration jerk for Z direction
| timeBodyGyroMeanX | Mean body gyroscope measurement for X direction
| timeBodyGyroMeanY | Mean body gyroscope measurement for Y direction
| timeBodyGyroMeanZ | Mean body gyroscope measurement for Z direction
| timeBodyGyroStdDevX | Standard deviation of body gyroscope measurement for X direction
| timeBodyGyroStdDevY | Standard deviation of body gyroscope measurement for Y direction
| timeBodyGyroStdDevZ | Standard deviation of body gyroscope measurement for Z direction
| timeBodyGyrojerkMeanX | Mean jerk signal of body for X direction
| timeBodyGyrojerkMeanY | Mean jerk signal of body for Y direction
| timeBodyGyrojerkMeanZ | Mean jerk signal of body for Z direction
| timeBodyGyrojerkStdDevX | Standard deviation of jerk signal of body for X direction
| timeBodyGyrojerkStdDevY | Standard deviation of jerk signal of body for Y direction
| timeBodyGyrojerkStdDevZ | Standard deviation of jerk signal of body for Z direction
| timeBodyAccMagMean | Mean magnitude of body Acc
| timeBodyAccMagStdDev | Standard deviation of magnitude of body Acc
| timeGravityAccMagMean | Mean gravity Acceleration magnitude
| timeGravityAccMagStdDev | Standard deviation of gravity Acceleration magnitude
| timeBodyAccJerkmagMean | Mean magnitude of body Acceleration jerk
| timeBodyAccJerkmagStdDev | Standard deviation of magnitude of body Acceleration jerk
| timeBodyGyroMagMean | Mean magnitude of body gyroscope measurement
| timeBodyGyroMagStdDev | Standard deviation of magnitude of body gyroscope measurement
| timeBodyGyroJerkMagMean | Mean magnitude of body body gyroscope jerk measurement
| timeBodyGyroJerkMagStdDev | Standard deviation of magnitude of body body gyroscope jerk measurement
| freqBodyAccMeanX | Mean frequency of body Acceleration for X direction
| freqBodyAccMeanY | Mean frequency of body Acceleration for Y direction
| freqBodyAccMeanZ | Mean frequency of body Acceleration for Z direction
| freqBodyAccStdDevX | Standard deviation of frequency of body Acceleration for X direction
| freqBodyAccStdDevY | Standard deviation of frequency of body Acceleration for Y direction
| freqBodyAccStdDevZ | Standard deviation of frequency of body Acceleration for Z direction
| freqBodyAccJerkMeanX | Mean frequency of body Acceleration jerk for X direction
| freqBodyAccJerkMeanY | Mean frequency of body Acceleration jerk for Y direction
| freqBodyAccJerkMeanZ | Mean frequency of body Acceleration jerk for Z direction
| freqBodyAccJerkStdDevX | Standard deviation frequency of body Acceleration jerk for X direction
| freqBodyAccJerkStdDevY | Standard deviation frequency of body Acceleration jerk for Y direction
| freqBodyAccJerkStdDevZ | Standard deviation frequency of body Acceleration jerk for Z direction
| freqBodyGyroMeanX | Mean frequency of body gyroscope measurement for X direction
| freqBodyGyroMeanY | Mean frequency of body gyroscope measurement for Y direction
| freqBodyGyroMeanZ | Mean frequency of body gyroscope measurement for Z direction
| freqBodyGyroStdDevX | Standard deviation frequency of body gyroscope measurement for X direction
| freqBodyGyroStdDevY | Standard deviation frequency of body gyroscope measurement for Y direction
| freqBodyGyroStdDevZ | Standard deviation frequency of body gyroscope measurement for Z direction
| freqBodyAccMagMean | Mean frequency of body Acceleration magnitude
| freqBodyAccMagStdDev | Standard deviation of frequency of body Acceleration magnitude
| freqBodyAccJerkmagMean | Mean frequency of body Acceleration jerk magnitude
| freqBodyAccJerkmagStdDev | Standard deviation of frequency of body Acceleration jerk magnitude
| freqBodyGyroMagMean | Mean frequency of magnitude of body gyroscope measurement
| freqBodyGyroMagStdDev | Standard deviation of frequency of magnitude of body gyroscope measurement
| freqBodyGyroJerkMagMean | Mean frequency of magnitude of body gyroscope jerk measurement
| freqBodyGyroJerkMagStdDev | Standard deviation frequency of magnitude of body gyroscope jerk measurement
