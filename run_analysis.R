## Getting the date and save it to working directory.

if(!file.exists("./data")) {
        dir.create("./data")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl, destfile = "./data/Dataset.zip", method = "curl")

unzip(zipfile = "./data/Dataset.zip", exdir = "./data")

## 1. Merges the training and the test data sets to create one data set.

## 1.1 test data:

XTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
SubjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## 1.2 train data:

XTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## 1.3 features and activity:

features <- read.table("./data/UCI HAR Dataset/features.txt")
activity <- read.table("./data/UCI HAR Dataset/activity_labels.txt")

## 1.4 merges train and test data in one data set:

X <- rbind(XTest, XTrain)
Y <- rbind(YTest, YTrain)
Subject <- rbind(SubjectTest, SubjectTrain)

dim_X <- dim(X)
dim_Y <- dim(Y)
dim_Subject <- dim(Subject)

print(dim_X)
print(dim_Y)
print(dim_Subject)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

index <- grep("mean\\(\\)|std\\(\\)", features[,2])
CountFeatures <- length(index)
print(CountFeatures)
subsetX <- X[,index]
dim_subsetX <- dim(subsetX)
print(dim_subsetX)

## 3. Uses descriptive activity names to name the activities in the data set.

Y[,1] <- activity[Y[,1],2]
headY <- head(Y)
print(headY)

## 4. Appropriately labels the data set with descriptive variable names.

names <- features[index, 2]
names(subsetX) <- names
names(Subject) <- "SubjectID"
names(Y) <- "Activity"
CleanedData <- cbind(Subject, Y, subsetX)
headCleanedData <- head(CleanedData[,c(1:4)])
print(headCleanedData)

## 5. From the data set in step 4, creates a second, independent tidy data
## set with the average of each variable for each activity and each subject.

library(data.table)
CleanedData2 <- data.table(CleanedData)
TidyData <- CleanedData2[, lapply(.SD, mean), by = "SubjectID,Activity"]
dimTidydata <- dim(TidyData)
print(dimTidydata)

write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
headTidyData <- head(TidyData[order(SubjectID)][,c(1:4), with = FALSE], 10)
print(headTidyData)

