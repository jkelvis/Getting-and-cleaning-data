#subject: 30 categories dispersed in "test" and "train" folders
#There are 2947 observations in the test folder, and 7352 observations in the train folder.
#There are 128 Variables in each file in the train and test folders.
#X_train is a file of 7352 obs. of  561 variables: Training set;
#Y_train is a file of 7352 obs. of  1 variable: Training labels;

#subject_train is a file of 7352 obs. of  1 variable:Each row identifies
#the subject who performed the activity for each window sample.
#Its range is from 1 to 30

#X_test is a file of 2947 obs. of  561 variables: Test set;
#Y_test is a file of 2947 obs. of  1 variable: Test labels;

#subject_test is a file of 2947 obs. of  1 variable
#the subject who performed the activity for each window sample.
#Its range is from 1 to 30

#features is a file of 561 obs. of  2 variables.It contains 561 feature names
#to discribe the columns in X_train/text files.


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
