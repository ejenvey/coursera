# coursera
My repo for Coursera code

run_analysis.r - This script processes data obtained from the UCI HAR machine learning library.  This data was collected from the accelerometers from the Samsung Galaxy S smartphone.  More detailed description of the processing of this data can be found in the comments of the R file itself.  At a high level, the following was performed:

1) Read in the training/test sets (train.txt and test.txt), the activity codes (y_train.txt and y_test.txt), subject codes (subject_train.txt and subject_test.txt), activity labels (activity_labels.txt), and column names (features.txt)
2) Clean the column names then set the names() vector for both the training and test sets to the more descriptive column names from features.txt
3) Combine the remaining data frames read in step #1 (adding the activity codes, subject codes, and activity labels, then appending the training set to the testing set)
4) Name the codes and labels in the new data set
5) Identify the columns in the new data set that contain "mean" or "std" and subset the data set to only include the codes & labels & these columns
6) Group the data set from #5 by subject and then by activity, then average all other columns
7) Add "avg_" to the averaged columns to denote they are averages
