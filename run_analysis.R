################################################################################
#                                                                              #
# Getting and Cleaning Data Course Project                                     #
# Gregorio Ambrosio Cestero                                                    #
#                                                                              #
# runAnalysis.R                                                                #
#                                                                              #
# This script performs the following steps on the UCI HAR Dataset:             # 
# 1 - Merge the training and the test sets to create one data set.             #
# 2 - Extract only the measurements on the mean and standard deviation for     #
#     each measurement.                                                        #
# 3 - Use descriptive activity names to name the activities in the data set.   #
# 4 - Appropriately label the data set with descriptive activity names.        # 
# 5 - Creates a second, independent tidy data set with the average of each     #
#     variable for each activity and each subject.                             #
#                                                                              #
################################################################################


if (!require("plyr")) {
        install.packages("plyr")
}

require(plyr)

message ("Getting and Cleaning Data Course Project")
message ("by Gregorio Ambrosio Cestero")
message ("Please, don't forget to comment or change your working directory in the script (line 31) !!!")

#Set working directory. Change this to your working directory
setwd("~/workspace/coursera/datasciencecoursera/03 Getting and Cleaning Data")


# 1 - Merges the training and the test sets to create one data set.

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)

# 2 - Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 

features <- read.table("./UCI HAR Dataset/features.txt")
measurements <- grep("-mean\\(\\)|-std\\(\\)",features[, 2])
X <- X[, measurements]

# 3 - Uses descriptive activity names to name the activities in the data set
activities_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
y[,1] = activities_labels[y[,1], 2]

# 4 - Appropriately labels the data set with descriptive variable names. 
XcolNames <- gsub("\\(\\)", "", features[measurements, 2]) # remove "()"
XcolNames <- gsub("mean", "Mean", XcolNames) # subs "mean" by "Mean"
XcolNames <- gsub("std", "StdDev", XcolNames) # subs "std" by "StdDev"
XcolNames <- gsub("-", "" , XcolNames) # remove "-" 
XcolNames <- gsub("^(t)","time",XcolNames) # subs "t" by "time"
XcolNames <- gsub("^(f)","freq",XcolNames) # subs "f" by "freq"
XcolNames <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",XcolNames) # let only one "Body"

names(X) <- XcolNames
names(y) <- "activity"
names(subject) <- "subject"

TidyDataSet1st = cbind(X,subject,y)

# 5 - From the data set in step 4, creates a second, independent tidy data set
#     with the average of each variable for each activity and each subject.

TidyDataSet2nd <- ddply(TidyDataSet1st, .(activity, subject), 
                        function(x) colMeans(x[, 1:66]))

write.table(TidyDataSet2nd, "TidyDataSet.txt", row.name=FALSE)