library(dplyr)

## 0. Read in data sets, and also perform step 4 at the same time.
## (4. Appropriately labels the data set with descriptive variable names.)
#
datadir <- "UCI HAR Dataset"
#
# i) Generate the headers of the X tables by using the info in the features.txt file.

filename = paste(datadir, "features.txt", sep="/")
features <- read.table(filename, col.names=c("FeatureCode", "FeatureLabel"), stringsAsFactors=F)
# (Make the header names compatible with R)
features$FeatureLabel <- gsub("-", ".", features$FeatureLabel)
features$FeatureLabel <- gsub("[()]", "", features$FeatureLabel)

# ii) Read in the data with the given headers

# a) test data
filename = paste(datadir, "test", "X_test.txt", sep="/")
X_test <- read.table(filename, col.names=features$FeatureLabel)
filename = paste(datadir, "test", "y_test.txt", sep="/")
y_test <- read.table(filename, col.names=c("ActivityID"))
filename = paste(datadir, "test", "subject_test.txt", sep="/")
subject_test <- read.table(filename, col.names=c("SubjectID"))
data_test <- cbind(subject_test, y_test, X_test)

# b) train data
filename = paste(datadir, "train", "X_train.txt", sep="/")
X_train <- read.table(filename, col.names=features$FeatureLabel)
filename = paste(datadir, "train", "y_train.txt", sep="/")
y_train <- read.table(filename, col.names=c("ActivityID"))
filename = paste(datadir, "train", "subject_train.txt", sep="/")
subject_train <- read.table(filename, col.names=c("SubjectID"))
data_train <- cbind(subject_train, y_train, X_train)

## 1. Merges the training and the test sets to create one data set.
#
data <- rbind(data_test, data_train)
#rm(data_test, data_train, X_test, X_train, y_test, y_train, subject_test, subject_train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
##    (including the ID columns)
#
meanStdCols <- grep("mean[.]|std[.]|mean$|std$|ID", names(data))
data <- select(data, meanStdCols)

## 3. Uses descriptive activity names to name the activities in the data set
#
filename = paste(datadir, "activity_labels.txt", sep="/")
activity_labels <- read.table(filename, col.names=c("ActivityID", "ActivityLabel"))
activity_labels$ActivityLabel <- factor(activity_labels$ActivityLabel, levels=activity_labels$ActivityLabel) 
data <- inner_join(data, activity_labels)

## 4. This step was performed above with step 0
## Here I'm just doing some rearranging of the columns,
## so that the two ID columns and the Label column are in the front
#
data <- select(data, 1:2, length(data), everything())
write.table(data, "data.csv", row.names=F)

## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
#
groups <- group_by(data, SubjectID, ActivityLabel)
data2 <- summarise_each(groups, c("mean"), 4:length(groups))
write.table(data2, "data2.csv", row.names=F)
