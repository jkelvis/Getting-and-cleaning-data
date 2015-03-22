## Thank you for looking at this readme file!
## This is course project for the coursera course "Getting and cleaning data"
##The rawdata included in the analysis are the following files, here is a brief introduction:

	#subject: 30 different subjects in this study, data are dispersed in "test" and "train" folders
	#There are 2947 observations in the test folder, and 7352 observations in the train folder.

	#X_train is a file of 7352 obs. of  561 variables: Training set;
	#Y_train is a file of 7352 obs. of  1 variable: Training labels;
	#subject_train is a file of 7352 obs. of  1 variable; Each row identifies the subject who performed the activity for each window sample.
	#Its range is from 1 to 30

	#X_test is a file of 2947 obs. of  561 variables: Test set;
	#Y_test is a file of 2947 obs. of  1 variable: Test labels;
	#subject_test is a file of 2947 obs. of  1 variable; the subject who performed the activity for each window sample.
	#Its range is from 1 to 30

	#features is a file of 561 obs. of  2 variables.It contains 561 feature names to discribe the columns in X_train/text files.

## Here is the way the "run_analysis.R" file works:
	#First, read relavant data into R;
	#Merge the training and the test sets to creat one dataset;
	#Label the data set with descriptive names listed in the "features.txt" file;
	#Find and extract only the measurements with "mean" or "std" information;
	#Create a second tidy data set as a summary of this dataset grouped by subject and activity;
	#Write the data into a text file according to instructions.