# Codebook

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation


Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Variables in the tidy data set

| Variable Name                  | Desription     |
| :----------------------------- |:---------------|
| subject | subject number range 1-30 |
| activity | activity label. One of (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) |
| mean.fBodyAcc.mean.X |  mean of mean of FFT applied to linear body acceleration (x axis) |
| mean.fBodyAcc.mean.Y |  mean of mean of FFT applied to linear body acceleration (y axis) |
| mean.fBodyAcc.mean.Z |  mean of mean of FFT applied to linear body acceleration (z axis) |
| mean.fBodyAcc.std.X |  mean of standard deviation of FFT applied to linear body acceleration (x axis) |
| mean.fBodyAcc.std.Y |  mean of standard deviation of FFT applied to linear body acceleration (y axis) |
| mean.fBodyAcc.std.Z |  mean of standard deviation of FFT applied to linear body acceleration (z axis) |
| mean.fBodyAccJerk.mean.X  |  mean of mean of FFT applied to linear body acceleration (jerk signal)(x axis) |
| mean.fBodyAccJerk.mean.Y  |  mean of mean of FFT applied to linear body acceleration (jerk signal)(y axis) |
| mean.fBodyAccJerk.mean.Z |  mean of mean of FFT applied to linear body acceleration (jerk signal)(z axis) |
| mean.fBodyAccJerk.std.X |  mean of standard deviation of FFT applied to linear body acceleration (jerk signal)(x axis) |
| mean.fBodyAccJerk.std.Y |  mean of standard deviation of FFT applied to linear body acceleration (jerk signal)(y axis) |
| mean.fBodyAccJerk.std.Z |  mean of standard deviation of FFT applied to linear body acceleration (jerk signal)(z axis) |
| mean.fBodyAccMag.mean | mean of mean of FFT applied to linear body acceleration (magnitude) |
| mean.fBodyAccMag.std | mean FFT applied to linear body acceleration (magnitude) |
| mean.fBodyBodyAccJerkMag.mean | mean of mean of FFT applied to Body linear body acceleration (magnitude of jerk signal)  |
| mean.fBodyBodyAccJerkMag.std | mean of standard deviation of FFT applied to Body linear body acceleration (magnitude of jerk signal)  |
| mean.fBodyBodyGyroJerkMag.mean | mean of mean of FFT applied to Body angular body velocity (magnitude of jerk signal)  |
| mean.fBodyBodyGyroJerkMag.std | mean of standard deviation of FFT applied to Body angular body velocity (magnitude of jerk signal)  |
| mean.fBodyBodyGyroMag.mean | mean of mean of FFT applied to Body angular body velocity (magnitude) |
| mean.fBodyBodyGyroMag.std | mean of standard deviation of FFT applied to Body angular body velocity (magnitude) |
| mean.fBodyGyro.mean.X |  mean of mean of FFT applied to angular body velocity (x axis) |
| mean.fBodyGyro.mean.Y |  mean of mean of FFT applied to angular body velocity (y axis) |
| mean.fBodyGyro.mean.Z |  mean of mean of FFT applied to angular body velocity (z axis) |
| mean.fBodyGyro.std.X |  mean of standard deviation of FFT applied to angular body velocity (x axis) |
| mean.fBodyGyro.std.Y |  mean of standard deviation of FFT applied to angular body velocity (y axis) |
| mean.fBodyGyro.std.Z |  mean of standard deviation of FFT applied to angular body velocity (z axis) |
| mean.tBodyAcc.mean.X |  mean of mean of time domain signal of linear body acceleration (x axis) |
| mean.tBodyAcc.mean.Y |  mean of mean of time domain signal of linear body acceleration (y axis) |
| mean.tBodyAcc.mean.Z |  mean of mean of time domain signal of linear body acceleration (z axis) |
| mean.tBodyAcc.std.X |  mean of standard deviation of time domain signal of linear body acceleration (x axis) |
| mean.tBodyAcc.std.Y |  mean of standard deviation of time domain signal of linear body acceleration (y axis) |
| mean.tBodyAcc.std.Z |  mean of standard deviation of time domain signal of linear body acceleration (z axis) |
| mean.tBodyAccJerk.mean.X |  mean of mean of time domain signal of linear body acceleration (jerk signal)(x axis) |
| mean.tBodyAccJerk.mean.Y |  mean of mean of time domain signal of linear body acceleration (jerk signal)(y axis) |
| mean.tBodyAccJerk.mean.Z |  mean of mean of time domain signal of linear body acceleration (jerk signal)(z axis) |
| mean.tBodyAccJerk.std.X |  mean of standard deviation of time domain signal of linear body acceleration (jerk signal)(x axis) |
| mean.tBodyAccJerk.std.Y |  mean of standard deviation of time domain signal of linear body acceleration (jerk signal)(y axis) |
| mean.tBodyAccJerk.std.Z |  mean of standard deviation of time domain signal of linear body acceleration (jerk signal)(z axis) |
| mean.tBodyAccJerkMag.mean | mean of mean of time domain signal of linear body acceleration (magnitude of jerk signal)  |
| mean.tBodyAccJerkMag.std | mean of standard deviation of time domain signal of linear body acceleration (magnitude of jerk signal)  |
| mean.tBodyAccMag.mean | mean of mean of time domain signal of linear body acceleration (magnitude) |
| mean.tBodyAccMag.std | mean of standard deviation of time domain signal of linear body acceleration (magnitude) |
| mean.tBodyGyro.mean.X |  mean of mean of time domain signal of angular body velocity (x axis) |
| mean.tBodyGyro.mean.Y |  mean of mean of time domain signal of angular body velocity (y axis) |
| mean.tBodyGyro.mean.Z |  mean of mean of time domain signal of angular body velocity (z axis) |
| mean.tBodyGyro.std.X |  mean of standard deviation of time domain signal of angular body velocity (x axis) |
| mean.tBodyGyro.std.Y |  mean of standard deviation of time domain signal of angular body velocity (y axis) |
| mean.tBodyGyro.std.Z |  mean of standard deviation of time domain signal of angular body velocity (z axis) |
| mean.tBodyGyroJerk.mean.X |  mean of mean of time domain signal of angular body velocity (jerk signal)(x axis) |
| mean.tBodyGyroJerk.mean.Y |  mean of mean of time domain signal of angular body velocity (jerk signal)(y axis) |
| mean.tBodyGyroJerk.mean.Z |  mean of mean of time domain signal of angular body velocity (jerk signal)(z axis) |
| mean.tBodyGyroJerk.std.X |  mean of standard deviation of time domain signal of angular body velocity (jerk signal)(x axis) |
| mean.tBodyGyroJerk.std.Y |  mean of standard deviation of time domain signal of angular body velocity (jerk signal)(y axis) |
| mean.tBodyGyroJerk.std.Z |  mean of standard deviation of time domain signal of angular body velocity (jerk signal)(z axis) |
| mean.tBodyGyroJerkMag.mean | mean of mean of time domain signal of angular body velocity (magnitude of jerk signal)  |
| mean.tBodyGyroJerkMag.std | mean of standard deviation of time domain signal of angular body velocity (magnitude of jerk signal)  |
| mean.tBodyGyroMag.mean | mean of mean of time domain signal of angular body velocity (magnitude) |
| mean.tBodyGyroMag.std | mean of standard deviation of time domain signal of angular body velocity (magnitude) |
| mean.tGravityAcc.mean.X |  mean of mean of time domain signal of linear gravity acceleration (x axis) |
| mean.tGravityAcc.mean.Y |  mean of mean of time domain signal of linear gravity acceleration (y axis) |
| mean.tGravityAcc.mean.Z |  mean of mean of time domain signal of linear gravity acceleration (z axis) |
| mean.tGravityAcc.std.X |  mean of standard deviation of time domain signal of linear gravity acceleration (x axis) |
| mean.tGravityAcc.std.Y |  mean of standard deviation of time domain signal of linear gravity acceleration (y axis) |
| mean.tGravityAcc.std.Z |  mean of standard deviation of time domain signal of linear gravity acceleration (z axis) |
| mean.tGravityAccMag.mean | mean of mean of time domain signal of linear gravity acceleration (magnitude) |
| mean.tGravityAccMag.std | mean of standard deviation of time domain signal of linear gravity acceleration (magnitude) |
