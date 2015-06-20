#setwd("~/data/UCI HAR Dataset/")
# read in all activities done while measuring
activities <- read.table(file="activity_labels.txt", stringsAsFactors=FALSE)

# read all features measured i.e. variable names
features <- read.table(file="features.txt", stringsAsFactors=FALSE)
# we're only interested in measurements on the mean and standard deviation for each measurement
retained_features <- grep("mean\\(|std\\(", features$V2)
# as the features' names are syntactically invalid > make them valid
features$feat_name <- gsub("()","",features$V2,fixed=TRUE)
features$feat_name <- make.names(features$feat_name, unique=TRUE)
# subset the feature names we're interested in
feature_names <- features$feat_name[retained_features]

# read in the training data and remove all columns that are not measurements on mean and std
train_data <- read.table(file="train/X_train.txt")
train_df <- train_data[,retained_features]
names(train_df) <- feature_names
# read in information about subjects and activities for training data
train_activities <- read.table(file="train/y_train.txt")
train_subjects <- read.table(file="train/subject_train.txt")
# add columns for subject and activity and name the activities properly
train_df <- cbind(subject=train_subjects$V1, 
                  activity=activities$V2[train_activities$V1],
                  train_df)

# read in the test data and remove all columns that are not measurements on mean and std
test_data <- read.table(file="test/X_test.txt")
test_df <- test_data[,retained_features]
names(test_df) <- feature_names
# read in information about subjects and activities for test data
test_activities <- read.table(file="test/y_test.txt")
test_subjects <- read.table(file="test/subject_test.txt")
# add columns for subject and activity and name the activities properly
test_df <- cbind(subject=test_subjects$V1, 
                 activity=activities$V2[test_activities$V1],
                 test_df)
# merge training and test data
merged_data <- rbind(train_df, test_df)

# now we're creating an independent tidy data set with the average of 
# each variable for each activity and each subject.
library(dplyr)
library(reshape2)
# we melt the data and apply the mean function to it
melt_data <- melt(merged_data, id=.(subject,activity))
tidy_narrow <- ddply(melt_data, .(subject,activity,variable), summarise, mean=mean(value, na.rm=TRUE))
# rename the feature names as these are now averages of the original values;
# for this we prepend the variable name with "mean."
tidy_narrow$variable <- paste("mean", tidy_narrow$variable, sep=".")

# since most people will feel more comfortable with a wide data set we cast it back
# into wide form and order it by subject and activity
tidy_wide <- dcast(tidy_narrow,subject+activity~variable, value.var="mean")
tidy_wide <- arrange(tidy_wide, subject, activity)

# finally export the tidy data set in csv format 
write.table(tidy_wide, file = "tidy_data.csv",row.names = FALSE)
