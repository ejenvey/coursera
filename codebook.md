========================================================== =
Codebook for UCI HAR Dataset analyzed by run_analysis.R
Eric Jenvey
Coursera- Getting and Cleaning Data
========================================================== =

subject_code, a code that identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  Integer data type

activity_label - the activity performed by the subject when the features/measurements were taken.  A factor variable with 6 levels (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The below variables are the averages for the mean and standard deviation estimated from each of the signals described in the features_info.txt file.  These averages are grouped according to subject and activity. Features_info.txt can be consulted for a more descriptive understanding of these measurements as well as additional measurements from the Human Activity Recognition Using Smartphones Dataset.  Please note, each of the below variables are of a numeric data type, and range from [-1,1].

avg_tBodyAcc-mean-X
avg_tBodyAcc-mean-Y
avg_tBodyAcc-mean-Z
avg_tGravityAcc-mean-X
avg_tGravityAcc-mean-Y
avg_tGravityAcc-mean-Z
avg_tBodyAccJerk-mean-X
avg_tBodyAccJerk-mean-Y
avg_tBodyAccJerk-mean-Z
avg_tBodyGyro-mean-X
avg_tBodyGyro-mean-Y
avg_tBodyGyro-mean-Z
avg_tBodyGyroJerk-mean-X
avg_tBodyGyroJerk-mean-Y
avg_tBodyGyroJerk-mean-Z
avg_tBodyAccMag-mean
avg_tGravityAccMag-mean
avg_tBodyAccJerkMag-mean
avg_tBodyGyroMag-mean
avg_tBodyGyroJerkMag-mean
avg_fBodyAcc-mean-X
avg_fBodyAcc-mean-Y
avg_fBodyAcc-mean-Z
avg_fBodyAcc-meanFreq-X
avg_fBodyAcc-meanFreq-Y
avg_fBodyAcc-meanFreq-Z
avg_fBodyAccJerk-mean-X
avg_fBodyAccJerk-mean-Y
avg_fBodyAccJerk-mean-Z
avg_fBodyAccJerk-meanFreq-X
avg_fBodyAccJerk-meanFreq-Y
avg_fBodyAccJerk-meanFreq-Z
avg_fBodyGyro-mean-X
avg_fBodyGyro-mean-Y
avg_fBodyGyro-mean-Z
avg_fBodyGyro-meanFreq-X
avg_fBodyGyro-meanFreq-Y
avg_fBodyGyro-meanFreq-Z
avg_fBodyAccMag-mean
avg_fBodyAccMag-meanFreq
avg_fBodyBodyAccJerkMag-mean
avg_fBodyBodyAccJerkMag-meanFreq
avg_fBodyBodyGyroMag-mean
avg_fBodyBodyGyroMag-meanFreq
avg_fBodyBodyGyroJerkMag-mean
avg_fBodyBodyGyroJerkMag-meanFreq
avg_angle(tBodyAccMean,gravity)
avg_angle(tBodyAccJerkMean),gravityMean)
avg_angle(tBodyGyroMean,gravityMean)
avg_angle(tBodyGyroJerkMean,gravityMean)
avg_angle(X,gravityMean)
avg_angle(Y,gravityMean)
avg_angle(Z,gravityMean)
avg_tBodyAcc-std-X
avg_tBodyAcc-std-Y
avg_tBodyAcc-std-Z
avg_tGravityAcc-std-X
avg_tGravityAcc-std-Y
avg_tGravityAcc-std-Z
avg_tBodyAccJerk-std-X
avg_tBodyAccJerk-std-Y
avg_tBodyAccJerk-std-Z
avg_tBodyGyro-std-X
avg_tBodyGyro-std-Y
avg_tBodyGyro-std-Z
avg_tBodyGyroJerk-std-X
avg_tBodyGyroJerk-std-Y
avg_tBodyGyroJerk-std-Z
avg_tBodyAccMag-std
avg_tGravityAccMag-std
avg_tBodyAccJerkMag-std
avg_tBodyGyroMag-std
avg_tBodyGyroJerkMag-std
avg_fBodyAcc-std-X
avg_fBodyAcc-std-Y
avg_fBodyAcc-std-Z
avg_fBodyAccJerk-std-X
avg_fBodyAccJerk-std-Y
avg_fBodyAccJerk-std-Z
avg_fBodyGyro-std-X
avg_fBodyGyro-std-Y
avg_fBodyGyro-std-Z
avg_fBodyAccMag-std
avg_fBodyBodyAccJerkMag-std
avg_fBodyBodyGyroMag-std
avg_fBodyBodyGyroJerkMag-std

activity_code- this code corresponds to the activity label.  It is a numeric variable ranging from 1-6.
  1 WALKING
  2 WALKING_UPSTAIRS
  3 WALKING_DOWNSTAIRS
  4 SITTING
  5 STANDING
  6 LAYING
