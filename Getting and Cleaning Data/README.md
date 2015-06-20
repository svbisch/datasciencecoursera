# Human Activity Recognition Using Smartphones Data Set

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

## Steps taken to create the tidy data set

To create the desired clean data set we first need to decide which features from the available 561 we want to retain. Since we're only
interested in measurement on the mean and standard deviation we select all with the strings "mean(" or "std(" in their names. The names
of these 66 selected features are not syntactically valid, so we delete all parentheses and substitute dashes by dots.

In the next step we read in the training and test data separately and add columns for the subjects and actitivy, giving the activities proper
names. We finally merge training and test data to obtain a data set with 10299 observations and 68 variables.

To create the final tidy data set with the average of each variable for each activity and each subject we melt the data (reshape2 library), apply the mean function on each unique set of subject, activity and measurement variable (with ddply) and cast it back to obtain the final wide form with each measurement in a separate column and one row for each subject doing 1 of the 6 activities. 

So for 30 participants doing 6 activities each we get 180 independent observations of 66 variables (mean of the mean and mean of the standard deviation) plus 2 columns for subject and activity.

This tidy data set is then written to disk in csv format and named "tidy_data.csv".
To read it back just issue this command:
```R
data <- read.table("tidy_data.csv", header = TRUE) 
View(data)
```
