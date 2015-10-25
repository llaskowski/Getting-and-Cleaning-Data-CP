---
title: "ReadME"
output: html_document
---

**Preliminary note:** For the script Run_Analysis.R to run correctly one may need to modify the first line of code which sets the working directory. By default it assumes that one has a folder named "Getting and Cleaning Data" in the default work directory. It assumes that the data studied, available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip has been downloaded and stored under the "Getting and Cleaning Data" folder.

**The task that Run_Analysis.R accomplishes follows the steps below:**

+  Set the working directory and loads all relevant data.

    The data includes the training and testing data along with the activity_labels.txt file and the features.txt file.

+  Merge the training and the test sets to create one data set.
training and testing sets are merged together in three steps:
      1) Training and Testing sets are merged together following the data types using rbind.Measurements (x) are merged together, activity code (y) are merged together and subject codes (subject) also to form 3 separate datasets.
  
      2) The names for each dataset are adapted to give clear description of what each column represents. Specifically the data from the features.txt is used.
  
      3) The three datasets are merged into one dataset using cbind.
  
+  Extract only the measurements on the mean and standard deviation for each measurement. 

    The data is extracted by matching the key words "mean" and "std" in the names of the dataset previously formed using the function grepl().

+  Uses descriptive activity names to name the activities in the data set

    Data stored as activity code is replaced by descritive words following the matching code provided in activity_labels.txt

+  Appropriately labels the data set with descriptive variable names. 

    At this stage this step has already been taken care of.

+  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

    Using functions melt() and dcast() setting "Activity" and "subject" as identifier, a tidy dataset is formed containing the mean of the measurements. write.table() us finally used to output the tidy dataset in a .txt file
