# Getting And Cleaning Data Project.
# Jooyoung Yu. 


################################################################################################
# Step 1 : Download Data set and unzip
# URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# Data Set is located in same path to this R script file.


################################################################################################
# Step 2 : Read data set
feature_set <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)
names(feature_set) <- c("index", "feature name")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

test_set <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)

train_set <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)


################################################################################################
# Step 3 : Merges the training and the test sets to create one data set. 
one_set <- rbind(train_set, test_set)
one_subject_set <- rbind(subject_train, subject_test)
one_y_set <- rbind(y_train, y_test)


################################################################################################
# Step 4 : Extracts only the measurements on the mean and standard deviation for each measurement.
names(one_set) <- feature_set[,"feature name"]
mean_sd_index <- grep("mean\\(", names(one_set))
mean_sd_index <- append(mean_sd_index, grep("std\\(", names(one_set)))

one_set<-one_set[,mean_sd_index]


################################################################################################
# Step 5 : Uses descriptive activity names to name the activities in the data set
names(activity_labels) <- c("activity id", "activity")
names(one_subject_set) <- c("subject")
names(one_y_set) <- c("activity id")

one_set <- cbind(one_set, one_subject_set, one_y_set)
one_set <- merge(one_set, activity_labels, by.x="activity id", by.y="activity id", all = TRUE)


################################################################################################
# Step 6 : Appropriately labels the data set with descriptive variable names.
# Already Done in Step 4. 


################################################################################################
# creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(.~subject+activity, data = one_set, mean)
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

