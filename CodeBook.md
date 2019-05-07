# CodeBook

## RunAnalysis.R
<Variables> 
- feature_set : dataframe read from "features.txt" whichi contains all feature names.
- activity_labels : dataframe read from "activity_label.txt" whichi contains activity id and description
- test_set, subject_test, y_text : dataframe read from test data sets.
- train_set, subejct_train, y_train : dataframe read from train data sets.

<Script>
Step 1 : Download Data set and unzip
Step 2 : Read data set
Step 3 : Merges the training and the test sets to create one data set. 
Step 4 : Extracts only the measurements on the mean and standard deviation for each measurement.
Step 5 : Uses descriptive activity names to name the activities in the data set
Step 6 : Appropriately labels the data set with descriptive variable names.
Step 7 : creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## tidy_data.txt 
- The output(tidy_data.txt) features are mean or standard deviation of original data set.
- The output(tidy_data.txt) data is mean of each features grouped by 'Subcjet' and 'Activity' 
