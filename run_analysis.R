
## read relavant data into R
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("./UCI HAR Dataset/test/Y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("./UCI HAR Dataset/train/Y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
features<-read.table("./UCI HAR Dataset/features.txt")
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
## Merge the training and the test sets to create one data set.
test<-cbind(X_test, Y_test, subject_test)
train<-cbind(X_train,Y_train, subject_train)
dataset<-rbind(test, train)

##Label the data set with descriptive variable names
##Extract only the measurements on the mean and standard deviation for each measurement. 
colnames(dataset)<-append(as.character(features$V2), c("activity", "subject"))
std_names <- grep("std", names(dataset))
mean_names <- grep("mean", names(dataset))
dataset<-dataset[,c(mean_names, std_names, 562, 563)]


##Use descriptive activity names to name the activities in the data set
tolower(activities$V2)
dataset$activity <- as.factor(dataset$activity)
levels(dataset$activity) <- activities$V2

##create a second, independent tidy data set with the average of each variable
##for each activity and each subject
summary<-summarise_each(group_by(dataset, subject, activity), "mean")

## write data into a txt file
write.table(summary, "summary.txt", row.name=F)
