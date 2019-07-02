# Importing the data from the files
library(dplyr)
fileURL <- "./data/UCI HAR Dataset/train/X_train.txt"
train <- read.table(fileURL)
fileURL <- "./data/UCI HAR Dataset/train/y_train.txt"
y_train <- read.table(fileURL)
fileURL <- "./data/UCI HAR Dataset/test/X_test.txt"
test <- read.table(fileURL)
fileURL <- "./data/UCI HAR Dataset/test/y_test.txt"
y_test <- read.table(fileURL)
fileURL <- "./data/UCI HAR Dataset/features.txt"
features <- read.table(fileURL)
fileURL <- "./data/UCI HAR Dataset/activity_labels.txt"
labels <- read.table(fileURL)
# Merging the training data and the test data
y_total <- rbind.data.frame(y_train,y_test)
total <- rbind.data.frame(train,test)
# Assigning the names to the variables of the dataset
names(total) <- features[,2]
# Seperating the mean and standard deviation variables
cols <- grep('mean\\(\\)|std\\(\\)', names(total), value=T)
sortedData <- total[cols]
# Adding the Activity label column to the dataset
sortedData <- cbind.data.frame(y_total,sortedData)
# Adding the Activity column to the dataset
Activity <- labels[sortedData$V1,2]
Activity <- as.character(Activity)
sortedData <- cbind.data.frame(Activity,sortedData)
# Renaming the variables
names(sortedData)[1] <- "Activity"
names(sortedData)[2] <- "Activity Label"
# Removing the () and -
names(sortedData)<-gsub("-","",names(sortedData),)
names(sortedData)<-gsub("\\(\\)","",names(sortedData),)
# Creating a tidy data frame
tidy_Data <- matrix(0,nrow = 6,ncol = 66)
tidy_Data <- data.frame(tidy_Data)
# Evaluating the mean of every variable for each activity
for (i in 1:6){
  b <- (t(colMeans(filter(sortedData,sortedData$`Activity Label`==i)[,-(1:2)])))
  tidy_Data[i,] <- b
}
names(tidy_Data) <- cols
names(tidy_Data)<-gsub("-","",names(tidy_Data),)
names(tidy_Data)<-gsub("\\(\\)","",names(tidy_Data),)
tidy_Data <- cbind(labels[,2],tidy_Data)
names(tidy_Data)[1] <- "Activity"
view(tidy_Data)