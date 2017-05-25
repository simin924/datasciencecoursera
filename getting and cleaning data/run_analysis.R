#see all files 
path_rf= "~/Documents/datasciencecoursera/data/UCI HAR Dataset"
files <- list.files(path_rf, recursive = T)
files


#read Activity, Subject and Feature
#Activity
ActivityTest <- read.table(file.path(path_rf, "test", "Y_test.txt"), header = F)
ActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"), header = F)

#Subject
SubjectTest <- read.table(file.path(path_rf, "test", "subject_test.txt"), header = F)
SubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"), header = F)

#Feature
FeatureTest <- read.table(file.path(path_rf, "test", "X_test.txt"), header = F)
FeatureTrain <- read.table(file.path(path_rf, "train", "X_train.txt"), header = F)

#look at data structure
str(ActivityTest)
str(ActivityTrain)
str(SubjectTest)
str(SubjectTrain)
str(FeatureTest)
str(FeatureTrain)

#1. Merges the training and the test sets to create one data set.
Activity <- rbind(ActivityTest, ActivityTrain)
Subject <- rbind(SubjectTest, SubjectTrain)
Feature <- rbind(FeatureTest, FeatureTrain)

#load feature names
FeatureNames <- read.table(file.path(path_rf, "features.txt"), header = F)
head(FeatureNames)

#rename variables
library(dplyr)
Activity <- rename(Activity, activity=V1)
head(Activity)

Subject <- rename(Subject, subject=V1)
head(Subject)

names(Feature) <- FeatureNames$V2
head(Feature, 1)

#Merge all data
data <- cbind(Activity, Subject, Feature)
str(data)
head(data, 1)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
selectedFeature <- FeatureNames$V2[grep("mean\\(\\)|std\\(\\)", FeatureNames$V2)]
select <- c(as.character(selectedFeature), "activity", "subject")
data <- subset(data, select=select)
head(data)


#3.Uses descriptive activity names to name the activities in the data set
activitylabel <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
activitylabel

names(activitylabel) <- c("ID", "activity1")
activitylabel

data <- merge(data, activitylabel, by.x = "activity", by.y="ID")

data <- select(data, -1)

data <- rename(data, activity = activity1)


#4.Appropriately labels the data set with descriptive variable names.
names(data)<-gsub("^t", "time", names(data))  
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

names(data)


#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
data2<-aggregate(. ~subject + activity, data, mean)   # .~subject + activity means many ~ one
data2<-data2[order(data2$subject,data2$activity),]
write.table(data2, file = "tidydata.txt",row.name=FALSE)


