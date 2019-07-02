# Getting and Cleaning Data Project
This is a project for the Coursera Course Getting and Cleadning Data. The run_analysis file performs the following tasks
  - Imports the training data, test data, features file, activity file into RStudio.
  - Using rbind function the test data and the train data is merged.
  - Using the grep funtion the variables measuring the mean and standard deviation of the features are segregated
  - A new data set called sortedData contains all observations with the above variables.
  - Activity associated to each observation is linked to the sorted Data.
  - Using for loop and filter funtion the mean value of every varible for each activity is evaluated.
  - Finally, the tidy_Data is given as output.
