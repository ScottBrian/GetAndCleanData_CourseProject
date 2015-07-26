This code book describes the contents of the tidy data created for the course project in the Johns Hopkins Univertisity MOOC course "Getting and Cleaning Data". The feature set (columns) for the tidy data set is a subset of the features provided in the Human Activity data set obtained from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

In order to understand the TidyDataSet provided for this course project, we must first understand the original Human Activity study and measures that were provided as input to the course project. The following decriptions are from the original files provided, and following that will be a description of the TidyDataSet.   

# From the Human Activity README.txt

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:  

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# From the Human Activity feature_info.txt

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ  
* tGravityAcc-XYZ  
* tBodyAccJerk-XYZ  
* tBodyGyro-XYZ  
* tBodyGyroJerk-XYZ  
* tBodyAccMag  
* tGravityAccMag  
* tBodyAccJerkMag  
* tBodyGyroMag  
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

# Tidy Data Set Decription

For the tidy data set, the subset of features were obtained from the source data set by including only those features that are mean or standard deviation measures, meaning any of the original names that contained either "-mean" or "-std". Note that the following angle features were not chose even though they contain "mean" in their names because they are not mean values but instead used mean values to create them.
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)

After obtaining the subset of names from the original feature list, the feature names were renamed to make them more readable. The test and train data sets from the orginal data set were merged in a data table and consist of only those columns for the aformentioned subset of features. The subject ID and activity ID data sets were also added to the merged data table. Next, the merged data table was grouped by both Subject ID and Activity ID, and then summarized using summarise_each with FUN(mean) to get the mean of the features for each Subject ID and Activity ID combination, for a total of 180 observation across 79 features (columns). It is this summarized data frame that is the tidy data set (TidyDataSet) provided for the course project. Note that by summarizing the original mean and standard deviation values by Subject_ID and Activity_ID, the resulting values are actually means of means and means of standard deviations. All of the columns names of the TidyDataSet measures are thus prefixed with "Mean_" to emphasize this fact that we have means of means and means of standard deviations.     

## units of measurement
For the tidy data set, the measures are means of the original data and thus inherit the original data units of measure. The original data as provided, however, was normalized over the closed interval [-1,+1] and therefore no longer represents the original units of measure. Thus, the tidy data set units of measures are means of normalized means and standard deviations.    


## list of features (columns)  

The following features (columns) make up the tidy data set:

The first two columns which are used for the summary grouping:

-   Subject\_ID - integer value that uniquley identifies the subject whose movements were measured
-   Activity\_ID - ineger value as factored variable that identifies the specific activity the subject engaged in. The activity values and names are:
* 1 WALKING
* 2 WALKING\_UPSTAIRS
* 3 WALKING\_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

The following features are a renamed subset of the original features. Note that the values for these features are the means of the original mean and standard deviation measures grouped by Subject\_ID and Activity\_ID:

num | name                                                | description
----|-----------------------------------------------------|------------------------------------
1   | Mean\_Time\_Body\_Accel\_Mean\_X                    | mean of time for body accelerometer mean for x axis
2   | Mean\_Time\_Body\_Accel\_Mean\_Y                    | mean of time for body accelerometer mean for y axis
3   | Mean\_Time\_Body\_Accel\_Mean\_Z                    | mean of time for body accelerometer mean for z axis 
4   | Mean\_Time\_Body\_Accel\_StdDev\_X                  | mean of time for body accelerometer std dev for x axis  
5   | Mean\_Time\_Body\_Accel\_StdDev\_Y                  | mean of time for body accelerometer std dev for y axis
6   | Mean\_Time\_Body\_Accel\_StdDev\_Z                  | mean of time for body accelerometer std dev for z axis
7   | Mean\_Time\_Gravity\_Accel\_Mean\_X                 | mean of time for gravity accelerometer mean for x axis
8   | Mean\_Time\_Gravity\_Accel\_Mean\_Y                 | mean of time for gravity accelerometer mean for y axis
9   | Mean\_Time\_Gravity\_Accel\_Mean\_Z                 | mean of time for gravity accelerometer mean for z axis
10  | Mean\_Time\_Gravity\_Accel\_StdDev\_X               | mean of time for gravity accelerometer std dev for x axis
11  | Mean\_Time\_Gravity\_Accel\_StdDev\_Y               | mean of time for gravity accelerometer std dev for y axis 
12  | Mean\_Time\_Gravity\_Accel\_StdDev\_Z               | mean of time for gravity accelerometer std dev for z axis
13  | Mean\_Time\_Body\_Accel\_Jerk\_Mean\_X              | mean of time for
14  | Mean\_Time\_Body\_Accel\_Jerk\_Mean\_Y              | mean of time for
15  | Mean\_Time\_Body\_Accel\_Jerk\_Mean\_Z              | mean of time for
16  | Mean\_Time\_Body\_Accel\_Jerk\_StdDev\_X            | mean of time for
17  | Mean\_Time\_Body\_Accel\_Jerk\_StdDev\_Y            | mean of time for
18  | Mean\_Time\_Body\_Accel\_Jerk\_StdDev\_Z            | mean of time for
19  | Mean\_Time\_Body\_Gyro\_Mean\_X                     | mean of time for
20  | Mean\_Time\_Body\_Gyro\_Mean\_Y                     | mean of time for
21  | Mean\_Time\_Body\_Gyro\_Mean\_Z                     | mean of time for
22  | Mean\_Time\_Body\_Gyro\_StdDev\_X                   | mean of time for
23  | Mean\_Time\_Body\_Gyro\_StdDev\_Y                   | mean of time for
24  | Mean\_Time\_Body\_Gyro\_StdDev\_Z                   | mean of time for
25  | Mean\_Time\_Body\_Gyro\_Jerk\_Mean\_X               | mean of time for
26  | Mean\_Time\_Body\_Gyro\_Jerk\_Mean\_Y               | mean of time for
27  | Mean\_Time\_Body\_Gyro\_Jerk\_Mean\_Z               | mean of time for
28  | Mean\_Time\_Body\_Gyro\_Jerk\_StdDev\_X             | mean of time for
29  | Mean\_Time\_Body\_Gyro\_Jerk\_StdDev\_Y             | mean of time for 
30  | Mean\_Time\_Body\_Gyro\_Jerk\_StdDev\_Z             | mean of time for
31  | Mean\_Time\_Body\_Accel\_Magnitude\_Mean            | mean of time for
32  | Mean\_Time\_Body\_Accel\_Magnitude\_StdDev          | mean of time for
33  | Mean\_Time\_Gravity\_Accel\_Magnitude\_Mean         | mean of time for
34  | Mean\_Time\_Gravity\_Accel\_Magnitude\_StdDev       | mean of time for
35  | Mean\_Time\_Body\_Accel\_Jerk\_Magnitude\_Mean      | mean of time for
36  | Mean\_Time\_Body\_Accel\_Jerk\_Magnitude\_StdDev    | mean of time for
37  | Mean\_Time\_Body\_Gyro\_Magnitude\_Mean             | mean of time for   
38  | Mean\_Time\_Body\_Gyro\_Magnitude\_StdDev           | mean of time for
39  | Mean\_Time\_Body\_Gyro\_Jerk\_Magnitude\_Mean       | mean of time for
40  | Mean\_Time\_Body\_Gyro\_Jerk\_Magnitude\_StdDev     | mean of time for
41  | Mean\_Freq\_Body\_Accel\_Mean\_X                    | mean of FFT frequency for
42  | Mean\_Freq\_Body\_Accel\_Mean\_Y                    | mean of FFT frequency for
43  | Mean\_Freq\_Body\_Accel\_Mean\_Z                    | mean of FFT frequency for
44  | Mean\_Freq\_Body\_Accel\_StdDev\_X                  | mean of FFT frequency for
45  | Mean\_Freq\_Body\_Accel\_StdDev\_Y                  | mean of FFT frequency for
46  | Mean\_Freq\_Body\_Accel\_StdDev\_Z                  | mean of FFT frequency for
47  | Mean\_Freq\_Body\_Accel\_MeanFreq\_X                | mean of FFT frequency for
48  | Mean\_Freq\_Body\_Accel\_MeanFreq\_Y                | mean of FFT frequency for
49  | Mean\_Freq\_Body\_Accel\_MeanFreq\_Z                | mean of FFT frequency for
50  | Mean\_Freq\_Body\_Accel\_Jerk\_Mean\_X              | mean of FFT frequency for
51  | Mean\_Freq\_Body\_Accel\_Jerk\_Mean\_Y              | mean of FFT frequency for
52  | Mean\_Freq\_Body\_Accel\_Jerk\_Mean\_Z              | mean of FFT frequency for
53  | Mean\_Freq\_Body\_Accel\_Jerk\_StdDev\_X            | mean of FFT frequency for
54  | Mean\_Freq\_Body\_Accel\_Jerk\_StdDev\_Y            | mean of FFT frequency for
55  | Mean\_Freq\_Body\_Accel\_Jerk\_StdDev\_Z            | mean of FFT frequency for
56  | Mean\_Freq\_Body\_Accel\_Jerk\_MeanFreq\_X          | mean of FFT frequency for
57  | Mean\_Freq\_Body\_Accel\_Jerk\_MeanFreq\_Y          | mean of FFT frequency for 
58  | Mean\_Freq\_Body\_Accel\_Jerk\_MeanFreq\_Z          | mean of FFT frequency for
59  | Mean\_Freq\_Body\_Gyro\_Mean\_X                     | mean of FFT frequency for
60  | Mean\_Freq\_Body\_Gyro\_Mean\_Y                     | mean of FFT frequency for
61  | Mean\_Freq\_Body\_Gyro\_Mean\_Z                     | mean of FFT frequency for
62  | Mean\_Freq\_Body\_Gyro\_StdDev\_X                   | mean of FFT frequency for
63  | Mean\_Freq\_Body\_Gyro\_StdDev\_Y                   | mean of FFT frequency for
64  | Mean\_Freq\_Body\_Gyro\_StdDev\_Z                   | mean of FFT frequency for
65  | Mean\_Freq\_Body\_Gyro\_MeanFreq\_X                 | mean of FFT frequency for
66  | Mean\_Freq\_Body\_Gyro\_MeanFreq\_Y                 | mean of FFT frequency for
67  | Mean\_Freq\_Body\_Gyro\_MeanFreq\_Z                 | mean of FFT frequency for
68  | Mean\_Freq\_Body\_Accel\_Magnitude\_Mean            | mean of FFT frequency for 
69  | Mean\_Freq\_Body\_Accel\_Magnitude\_StdDev          | mean of FFT frequency for
70  | Mean\_Freq\_Body\_Accel\_Magnitude\_MeanFreq        | mean of FFT frequency for    
71  | Mean\_Freq\_Body\_Accel\_Jerk\_Magnitude\_Mean      | mean of FFT frequency for
72  | Mean\_Freq\_Body\_Accel\_Jerk\_Magnitude\_StdDev    | mean of FFT frequency for
73  | Mean\_Freq\_Body\_Accel\_Jerk\_Magnitude\_MeanFreq  | mean of FFT frequency for 
74  | Mean\_Freq\_Body\_Gyro\_Magnitude\_Mean             | mean of FFT frequency for
75  | Mean\_Freq\_Body\_Gyro\_Magnitude\_StdDev           | mean of FFT frequency for
76  | Mean\_Freq\_Body\_Gyro\_Magnitude\_MeanFreq         | mean of FFT frequency for
77  | Mean\_Freq\_Body\_Gyro\_Jerk\_Magnitude\_Mean       | mean of FFT frequency for
78  | Mean\_Freq\_Body\_Gyro\_Jerk\_Magnitude\_StdDev     | mean of FFT frequency for
79  | Mean\_Freq\_Body\_Gyro\_Jerk\_Magnitude\_MeanFreq   | mean of FFT frequency for
