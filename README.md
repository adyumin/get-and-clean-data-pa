get-and-clean-data-pa
=====================

Getting and Cleaning Data Project for Coursera Course "Getting and Cleaning Data"

Script run_analysis.R must be located inside "UCI HAR Dataset" directory.

Input:
features located in X_*.txt files in train and test directories,
labels for classification in Y_*.txt files in train and test directories,
subjects in subject_*.txt files in train and test directories.
Also script use features.txt file for names of features and "activity_labels.txt" for activities names.

Output:
firstset.txt -  data set with only the measurements on the mean and standard deviation for each measurement.
secondset.txt -  data set with the average of each variable for each activity and each subject.  

Data transformation is very straight forward (see run_analysis.R , it is highly commented)

There are main steps of data transformation and cleaning:
 
1) Get features labels
2) Filter features contained "mean()" and "std()" in it names (indexes and corresponding labels)
3) Get labels (activities) names.
4) Read features, labels and subject files from train and test folders
5) Merge corresponding train and test data frames vertically, than merge merged frames horizontally with only filtered columns for first data set, and all columns for second.
6) Set meaningful names for columns and labels (activities) 
7) Aggregate data by averaging by activities and subject for second data frame
8) Write out first and second data set to files.
