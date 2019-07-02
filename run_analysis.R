# Downloading from the source
library(dplyr)
library(reshape2)
download <- "UCIdata.zip"
fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir <- "UCI_HAR_Dataset"
if(!file.exists(dir)){
  download.file(fileURL, download,mode = "wb")
}
unzip("UCIdata.zip",files = NULL,exdir = ".")


#Importing the files 
fileURL <- "UCI HAR Dataset/train/X_train.txt"
train <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/test/X_test.txt"
test <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/features.txt"
features <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/activity_labels.txt"
labels <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/train/subject_train.txt"
subject_train <- read.table(fileURL)
fileURL <- "UCI HAR Dataset/test/subject_test.txt"
subject_test <- read.table(fileURL)


# Merging the training data and the test data
y_total <- rbind.data.frame(y_train,y_test)
subject_total <- rbind.data.frame(subject_train,subject_test)
total <- rbind.data.frame(train,test)


# Assigning the names to the variables of the dataset
names(total) <- features[,2]
# Seperating the mean and standard deviation variables
cols <- grep('mean\\(\\)|std\\(\\)', names(total), value=T)
sortedData <- total[cols]
# Adding the Activity label column to the dataset
sortedData <- cbind.data.frame(subject_total,sortedData)
sortedData <- cbind.data.frame(y_total,sortedData)
# Adding the Activity column to the dataset
Activity <- labels[sortedData$V1,2]
Activity <- as.character(Activity)
sortedData <- cbind.data.frame(Activity,sortedData)
# Renaming the variables
names(sortedData)[2] <- "Activity Label"
names(sortedData)[3] <- "Subject"


# Removing the () and -
names(sortedData)<-gsub("-","",names(sortedData),)
names(sortedData)<-gsub("\\(\\)","",names(sortedData),)


# Creating a tidy data frame
temp_set <- melt(sortedData, id=c("Subject","Activity"))
Tidy_Data <- dcast(temp_set, Subject+Activity ~ variable, mean)
write.table(Tidy_Data, "Tidy_Data.txt", row.name=FALSE)