# Getting and Cleaning Data Project
Background:
A group of 30 people (refered as subjects in the project) were monitored by wearable smart devices. Through acclerometeres few quantities listed in the features column were measured while performing 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, LAYING, SITTING, STANDING). The obtained data was splitted into train and test datasets.

Introduction to datasets:
  X_train dataset consists of 561 variables and 7352 observations.
  X_test dataset consists of 561 variables and 2947 observations.
  y_train dataset consists of 1 variable and 7352 observations. This explains the activity performed while taking the measurement.
  y_test dataset consists of 1 variable and 2947 observations. This explains the activity performed while taking the measurement.
  subject_train dataset consists of 1 variable and 7352 observations. This dataset tells us the subject.
  subject_test dataset consists of 1 variable and 2947 observations. This dataset tells us the subject.

Methodology:
This is a project for the Coursera Course Getting and Cleadning Data. The run_analysis file performs the following tasks
  - Imports the training data, test data, features file, activity file into RStudio.
  - Using rbind function the test data and the train data is merged.
  - Using the grep funtion the variables measuring the mean and standard deviation of the features are segregated
  - A new data set called sortedData contains all observations with the above variables.
  - Activity associated to each observation is linked to the sorted Data.
  - Using melt and dcast functions the average value for every variable for each activity performed by each subject is evaluated.
  - Finally, the tidy_Data is given as output.
