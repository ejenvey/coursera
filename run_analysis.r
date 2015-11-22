#load required packages
library(dplyr)

#read test and training sets into R
train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
test <- read.table("~/UCI HAR Dataset/test/X_test.txt")

#read in the activity codes corresponding to the 6 activities in activity_labels.txt
names_train <- read.table("~/UCI HAR Dataset/train/y_train.txt")
names_test <- read.table("~/UCI HAR Dataset/test/y_test.txt")

#read in the subject codes that correspond to the 30 subjects in the study
subjects_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
subjects_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt")

#read in the activity labels
activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")

#read in the column names and set them to both the test and train data sets
column_names <- read.table("~/UCI HAR Dataset/features.txt")

#remove unnecessary parentheses, as they could potentially confuse a user
column_names[2] <- lapply(column_names[2],function(x) gsub("\\()","",x))

#set the column names of the test and train data frames to the modified column names from column_names
names(test) <- column_names[,2]
names(train) <- column_names[,2]

#add the subject codes and activity labels to both the training and testing data frames
test <- cbind(test,names_test,subjects_test)
train <- cbind(train,names_train, subjects_train)

#rename the activity code to a more descriptive name
names(train)[562] <- "activity_code"
names(test)[562] <- "activity_code"

#rename the subject code to a more descriptive name
names(train)[563] <- "subject_code"
names(test)[563] <- "subject_code"

#combine the training and testing sets (have same column names, so can simply bind them)
merged <- rbind(test, train)

#join the newly formed data frame to the activity labels data frame on the activity code, to obtain the more descriptive activity labels
merged_labeled <- merge(merged,activity_labels,by.x="activity_code",by.y="V1")

#rename the newly obtained activity labels to a more descriptive name
names(merged_labeled)[564] <- "activity_label"

#search this data frame for the indicies of all columns containing "mean" and "std"
meancols <- grep("mean",tolower(names(merged_labeled)))
stdcols <- grep("std",tolower(names(merged_labeled)))

#combine these indices into one vector
Totalcols <- append(meancols,stdcols)

#append the indices of the subject code, activity code, and activity label columns
Totalcols <- append(Totalcols,1)
Totalcols <- append(Totalcols,563)
Totalcols <- append(Totalcols,564)

#subset the data set to only obtain those columns whose indices fall within the Totalcols vector
subsetData <- merged_labeled[,Totalcols]

#prep to use dplyr
finalData <- tbl_df(subsetData)

#group this data frame first by subject code then by each activity, then run the mean function
#across each remaining column
finalSummarizedData <- finalData %>% group_by(subject_code,activity_label) %>% summarize_each(funs(mean))


#add "avg_" to the beginning of each column name in Summarized Data to reflect that they are averages
names(finalSummarizedData)[3:88] <- lapply(names(finalSummarizedData[3:88]),function(x) paste("avg_",x,sep=""))

