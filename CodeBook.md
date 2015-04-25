# Code book

## Data Description

Data collected from the accelerometers of the Samsung Galaxy S smartphones, which were worn by a group of 30 volunteers. Each person performed six activities. There were 128 readings.

Each record in the dataset provides:

* The measurements of:
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope.
  - "Jerk" values (derivative w.r.t. time) for the above two quantities.
  - Frequency values for the above two quantities.
  - Magnitudes of the above quantities.
* An activity label.
* An identifier of the subject who carried out the experiment. 

Note: the original dataset was much larger. Each record in the original dataset provides:

* A 561-feature vector with time and frequency domain variables, which are measurements on:
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  - Triaxial Angular velocity from the gyroscope.
* An activity label.
* An identifier of the subject who carried out the experiment. 

Full description of the original data can be found at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Source

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## Variables

```
SubjectID                       The ID of participants.
ActivityID                      The ID of the six monitored activities.
ActivityLabel                   The description of the activities.

tBodyAcc.mean.X                 The 3D mean and stdev of
tBodyAcc.mean.Y                 the body acceleration signal
tBodyAcc.mean.Z 
tBodyAcc.std.X 
tBodyAcc.std.Y 
tBodyAcc.std.Z 

tGravityAcc.mean.X              The 3D mean and stdev of 
tGravityAcc.mean.Y              the gravity acceleration signal
tGravityAcc.mean.Z 
tGravityAcc.std.X 
tGravityAcc.std.Y 
tGravityAcc.std.Z 

tBodyAccJerk.mean.X             The 3D mean and stdev of
tBodyAccJerk.mean.Y             the body acceleration "jerk" signal
tBodyAccJerk.mean.Z 
tBodyAccJerk.std.X 
tBodyAccJerk.std.Y 
tBodyAccJerk.std.Z 

tBodyGyro.mean.X                The 3D mean and stdev of 
tBodyGyro.mean.Y                the body angular velocity signal
tBodyGyro.mean.Z 
tBodyGyro.std.X 
tBodyGyro.std.Y 
tBodyGyro.std.Z 

tBodyGyroJerk.mean.X            The 3D mean and stdev of 
tBodyGyroJerk.mean.Y            the body angular velociy "jerk" signal
tBodyGyroJerk.mean.Z 
tBodyGyroJerk.std.X 
tBodyGyroJerk.std.Y 
tBodyGyroJerk.std.Z 

tBodyAccMag.mean                The mean and stdev magnitude of
tBodyAccMag.std                 the body acceleration signal

tGravityAccMag.mean             The mean and stdev magnitude of
tGravityAccMag.std              the gravity acceleration signal

tBodyAccJerkMag.mean            The mean and stdev magnitude of
tBodyAccJerkMag.std             the body acceleration "jerk" signal

tBodyGyroMag.mean               The mean and stdev magnitude of
tBodyGyroMag.std                the body angular velocity signal

tBodyGyroJerkMag.mean           The mean and stdev magnitude of
tBodyGyroJerkMag.std            the body angular velociy "jerk" signal

fBodyAcc.mean.X                 The 3D mean and stdev of the frequency of
fBodyAcc.mean.Y                 the body acceleration signal
fBodyAcc.mean.Z 
fBodyAcc.std.X 
fBodyAcc.std.Y 
fBodyAcc.std.Z 

fBodyAccJerk.mean.X             The 3D mean and stdev of the frequency of
fBodyAccJerk.mean.Y             the body acceleration "jerk" signal
fBodyAccJerk.mean.Z 
fBodyAccJerk.std.X 
fBodyAccJerk.std.Y 
fBodyAccJerk.std.Z 

fBodyGyro.mean.X                The 3D mean and stdev of the frequency of
fBodyGyro.mean.Y                the body angular velocity signal
fBodyGyro.mean.Z 
fBodyGyro.std.X 
fBodyGyro.std.Y 
fBodyGyro.std.Z 

fBodyAccMag.mean                The mean and stdev magnitude of the freq of
fBodyAccMag.std                 the body acceleration signal

fBodyBodyAccJerkMag.mean        The mean and stdev magnitude of the freq of
fBodyBodyAccJerkMag.std         the body acceleration "jerk" signal

fBodyBodyGyroMag.mean           The mean and stdev magnitude of the freq of
fBodyBodyGyroMag.std            the body angular velocity signal

fBodyBodyGyroJerkMag.mean       The mean and stdev magnitude of the freq of
fBodyBodyGyroJerkMag.std        the body angular velociy "jerk" signal
```

## Transformations

* The information in the three files `subject_???.txt`, `y_???.txt`, `X_???.txt` were combined by columns to form the principal dataset.
* The `???` stands for either the training set or the test set. For the final dataset, these two sets were merged.
* The column name for the `subject_???.txt` file is `SubjectID`.
* The column name for the `y_???.txt` file is `ActivityID`.
* The column names for the `X_???.txt` file were constructed from the `features.txt` file. To make the names compatible with R, we replaced:
  - "-" with "."
  - "()" with "<blank>"
* The ActivityLabel column was added to the dataset by joining the information in the `activity_labels.txt` 
file with the info in the `y_???.txt` file.
* Only the mean & stdev of the measurements were kept.  This was done via searching (`grep`) for the expression `"mean[.]|std[.]|mean$|std$|ID"` in the headers.
* A second dataset was formed by taking the average of the measurements, as grouped by the `SubjectID` and `ActivityLabel`. This data set has `(30 subjects x 6 activities) = 180 observations` rows.
* The datasets are saved in space separated text format.

