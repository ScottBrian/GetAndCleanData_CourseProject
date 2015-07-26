This code book describes the contents of the tidy data set that was created at part of the course project in the Johns Hopkins Univertisity MOOC course "Getting and Cleaning Data". The feature set for the tidy data set is a subset of the features provided in the Human Activity data set obtained from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The source data base was created using accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For the tidy data set, the subset of features were obtained from the source data set by including only those features that are mean or standard deviation measures, meaning any of the original names that contained either "-mean" or "-std". Note that the following angle features were not chose even though they contain "mean" in their names because they do not appear to be mean values but instea used mean values to create them.
\* angle(tBodyAccMean,gravity)
\* angle(tBodyAccJerkMean),gravityMean)
\* angle(tBodyGyroMean,gravityMean)
\* angle(tBodyGyroJerkMean,gravityMean)
\* angle(X,gravityMean)
\* angle(Y,gravityMean)
\* angle(Z,gravityMean)

After obtaining the subset of names from the original feature list, the feature names were renamed to make them more readable. The test and train data sets from the orginal data set were merged in a data table and consist of only those columns for the aformentioned subset of features. The subject ID and activity ID data sets were also added to the merged data table. Next, the merged data table was grouped by both Subject ID and Activity ID, and then summarizewas done to get the mean of the features for each Subject ID and Activity ID combination, a for a total of 180 observation across 79 features (variables). It is this summarized data frame that is the tidy data set provided for the course project.

The following features (variables) make up the tidy data set:

These are the first two columns which are used for the summary grouping:

-   Subject\_ID - integer value that uniquley identifies the subject whose movements were measured
-   Activity\_ID - ineger value as factored variable that identifies the specific activity the subject engaged in. The activity values and names are:
-   1 WALKING
-   2 WALKING\_UPSTAIRS
-   3 WALKING\_DOWNSTAIRS
-   4 SITTING
-   5 STANDING
-   6 LAYING

The following features are a renamed subset of the original features. Note that the values for these features are the means of the original mean and standard deviation measures grouped by Subject\_ID and Activity\_ID:

Time\_Body\_Accel\_Mean\_X
Time\_Body\_Accel\_Mean\_Y
Time\_Body\_Accel\_Mean\_Z
Time\_Body\_Accel\_StdDev\_X
Time\_Body\_Accel\_StdDev\_Y
Time\_Body\_Accel\_StdDev\_Z
Time\_Gravity\_Accel\_Mean\_X
Time\_Gravity\_Accel\_Mean\_Y
Time\_Gravity\_Accel\_Mean\_Z
Time\_Gravity\_Accel\_StdDev\_X
Time\_Gravity\_Accel\_StdDev\_Y
Time\_Gravity\_Accel\_StdDev\_Z
Time\_Body\_Accel\_Jerk\_Mean\_X
Time\_Body\_Accel\_Jerk\_Mean\_Y
Time\_Body\_Accel\_Jerk\_Mean\_Z
Time\_Body\_Accel\_Jerk\_StdDev\_X
Time\_Body\_Accel\_Jerk\_StdDev\_Y
Time\_Body\_Accel\_Jerk\_StdDev\_Z
Time\_Body\_Gyro\_Mean\_X
Time\_Body\_Gyro\_Mean\_Y
Time\_Body\_Gyro\_Mean\_Z
Time\_Body\_Gyro\_StdDev\_X
Time\_Body\_Gyro\_StdDev\_Y
Time\_Body\_Gyro\_StdDev\_Z
Time\_Body\_Gyro\_Jerk\_Mean\_X
Time\_Body\_Gyro\_Jerk\_Mean\_Y
Time\_Body\_Gyro\_Jerk\_Mean\_Z
Time\_Body\_Gyro\_Jerk\_StdDev\_X
Time\_Body\_Gyro\_Jerk\_StdDev\_Y
Time\_Body\_Gyro\_Jerk\_StdDev\_Z
Time\_Body\_Accel\_Magnitude\_Mean
Time\_Body\_Accel\_Magnitude\_StdDev
Time\_Gravity\_Accel\_Magnitude\_Mean
Time\_Gravity\_Accel\_Magnitude\_StdDev
Time\_Body\_Accel\_Jerk\_Magnitude\_Mean
Time\_Body\_Accel\_Jerk\_Magnitude\_StdDev
Time\_Body\_Gyro\_Magnitude\_Mean
Time\_Body\_Gyro\_Magnitude\_StdDev
Time\_Body\_Gyro\_Jerk\_Magnitude\_Mean
Time\_Body\_Gyro\_Jerk\_Magnitude\_StdDev
Freq\_Body\_Accel\_Mean\_X
Freq\_Body\_Accel\_Mean\_Y
Freq\_Body\_Accel\_Mean\_Z
Freq\_Body\_Accel\_StdDev\_X
Freq\_Body\_Accel\_StdDev\_Y
Freq\_Body\_Accel\_StdDev\_Z
Freq\_Body\_Accel\_MeanFreq\_X
Freq\_Body\_Accel\_MeanFreq\_Y
Freq\_Body\_Accel\_MeanFreq\_Z
Freq\_Body\_Accel\_Jerk\_Mean\_X
Freq\_Body\_Accel\_Jerk\_Mean\_Y
Freq\_Body\_Accel\_Jerk\_Mean\_Z
Freq\_Body\_Accel\_Jerk\_StdDev\_X
Freq\_Body\_Accel\_Jerk\_StdDev\_Y
Freq\_Body\_Accel\_Jerk\_StdDev\_Z
Freq\_Body\_Accel\_Jerk\_MeanFreq\_X
Freq\_Body\_Accel\_Jerk\_MeanFreq\_Y
Freq\_Body\_Accel\_Jerk\_MeanFreq\_Z
Freq\_Body\_Gyro\_Mean\_X
Freq\_Body\_Gyro\_Mean\_Y
Freq\_Body\_Gyro\_Mean\_Z
Freq\_Body\_Gyro\_StdDev\_X
Freq\_Body\_Gyro\_StdDev\_Y
Freq\_Body\_Gyro\_StdDev\_Z
Freq\_Body\_Gyro\_MeanFreq\_X
Freq\_Body\_Gyro\_MeanFreq\_Y
Freq\_Body\_Gyro\_MeanFreq\_Z
Freq\_Body\_Accel\_Magnitude\_Mean
Freq\_Body\_Accel\_Magnitude\_StdDev
Freq\_Body\_Accel\_Magnitude\_MeanFreq
Freq\_Body\_Accel\_Jerk\_Magnitude\_Mean
Freq\_Body\_Accel\_Jerk\_Magnitude\_StdDev
Freq\_Body\_Accel\_Jerk\_Magnitude\_MeanFreq
Freq\_Body\_Gyro\_Magnitude\_Mean
Freq\_Body\_Gyro\_Magnitude\_StdDev
Freq\_Body\_Gyro\_Magnitude\_MeanFreq
Freq\_Body\_Gyro\_Jerk\_Magnitude\_Mean
Freq\_Body\_Gyro\_Jerk\_Magnitude\_StdDev
Freq\_Body\_Gyro\_Jerk\_Magnitude\_MeanFreq
