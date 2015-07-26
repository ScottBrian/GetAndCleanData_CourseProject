This code book describes the contents of the tidy data set that was created at part of the course project in the Johns Hopkins Univertisity MOOC course "Getting and Cleaning Data". The feature set for the tidy data set is a subset of the features provided in the Human Activity data set obtained from: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

The source data base was created using accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

For the tidy data set, the subset of features were obtained from the source data set by including only those features that are mean or standard deviation measures, meaning any of the original names that contained either "-mean" or "-std". Note that the following angle features were not chose even though they contain "mean" in their names because they do not appear to be mean values but instea used mean values to create them.
* angle(tBodyAccMean,gravity)
* angle(tBodyAccJerkMean),gravityMean)
* angle(tBodyGyroMean,gravityMean)
* angle(tBodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)

After obtaining the subset of names from the original feature list, the feature names were renamed to make them more readable. The test and train data sets from the orginal data set were merged in a data table and consist of only those columns for the aformentioned subset of features. The subject ID and activity ID data sets were also added to the merged data table. Next, the merged data table was grouped by both Subject ID and Activity ID, and then summarizewas done to get the mean of the features for each Subject ID and Activity ID combination, a for a total of 180 observation across 79 features (variables). It is this summarized data frame that is the tidy data set provided for the course project.

The following features (variables) make up the tidy data set:

These are the first two columns which are used for the summary grouping:

-   Subject\_ID - integer value that uniquley identifies the subject whose movements were measured
-   Activity\_ID - ineger value as factored variable that identifies the specific activity the subject engaged in. The activity values and names are:
* 1 WALKING
* 2 WALKING\_UPSTAIRS
* 3 WALKING\_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

The following features are a renamed subset of the original features. Note that the values for these features are the means of the original mean and standard deviation measures grouped by Subject\_ID and Activity\_ID:

1. Mean_Time\_Body\_Accel\_Mean\_X
2. Mean_Time\_Body\_Accel\_Mean\_Y
3. Mean_Time\_Body\_Accel\_Mean\_Z
4. Mean_Time\_Body\_Accel\_StdDev\_X
5. Mean_Time\_Body\_Accel\_StdDev\_Y
6. Mean_Time\_Body\_Accel\_StdDev\_Z
7. Mean_Time\_Gravity\_Accel\_Mean\_X
8. Mean_Time\_Gravity\_Accel\_Mean\_Y
9. Mean_Time\_Gravity\_Accel\_Mean\_Z
10. Mean_Time\_Gravity\_Accel\_StdDev\_X
11. Mean_Time\_Gravity\_Accel\_StdDev\_Y
12. Mean_Time\_Gravity\_Accel\_StdDev\_Z
13. Mean_Time\_Body\_Accel\_Jerk\_Mean\_X
14. Mean_Time\_Body\_Accel\_Jerk\_Mean\_Y
15. Mean_Time\_Body\_Accel\_Jerk\_Mean\_Z
16. Mean_Time\_Body\_Accel\_Jerk\_StdDev\_X
17. Mean_Time\_Body\_Accel\_Jerk\_StdDev\_Y
18. Mean_Time\_Body\_Accel\_Jerk\_StdDev\_Z
19. Mean_Time\_Body\_Gyro\_Mean\_X
20. Mean_Time\_Body\_Gyro\_Mean\_Y
21. Mean_Time\_Body\_Gyro\_Mean\_Z
22. Mean_Time\_Body\_Gyro\_StdDev\_X
23. Mean_Time\_Body\_Gyro\_StdDev\_Y
24. Mean_Time\_Body\_Gyro\_StdDev\_Z
25. Mean_Time\_Body\_Gyro\_Jerk\_Mean\_X
26. Mean_Time\_Body\_Gyro\_Jerk\_Mean\_Y
27. Mean_Time\_Body\_Gyro\_Jerk\_Mean\_Z
28. Mean_Time\_Body\_Gyro\_Jerk\_StdDev\_X
29. Mean_Time\_Body\_Gyro\_Jerk\_StdDev\_Y
30. Mean_Time\_Body\_Gyro\_Jerk\_StdDev\_Z
31. Mean_Time\_Body\_Accel\_Magnitude\_Mean
32. Mean_Time\_Body\_Accel\_Magnitude\_StdDev
33. Mean_Time\_Gravity\_Accel\_Magnitude\_Mean
34. Mean_Time\_Gravity\_Accel\_Magnitude\_StdDev
35. Mean_Time\_Body\_Accel\_Jerk\_Magnitude\_Mean
36. Mean_Time\_Body\_Accel\_Jerk\_Magnitude\_StdDev
37. Mean_Time\_Body\_Gyro\_Magnitude\_Mean
38. Mean_Time\_Body\_Gyro\_Magnitude\_StdDev
39. Time\_Body\_Gyro\_Jerk\_Magnitude\_Mean
40. Time\_Body\_Gyro\_Jerk\_Magnitude\_StdDev
41. Freq\_Body\_Accel\_Mean\_X
42. Freq\_Body\_Accel\_Mean\_Y
43. Freq\_Body\_Accel\_Mean\_Z
44. Freq\_Body\_Accel\_StdDev\_X
45. Freq\_Body\_Accel\_StdDev\_Y
46. Freq\_Body\_Accel\_StdDev\_Z
47. Freq\_Body\_Accel\_MeanFreq\_X
48. Freq\_Body\_Accel\_MeanFreq\_Y
49. Freq\_Body\_Accel\_MeanFreq\_Z
50. Freq\_Body\_Accel\_Jerk\_Mean\_X
51. Freq\_Body\_Accel\_Jerk\_Mean\_Y
52. Freq\_Body\_Accel\_Jerk\_Mean\_Z
53. Freq\_Body\_Accel\_Jerk\_StdDev\_X
54. Freq\_Body\_Accel\_Jerk\_StdDev\_Y
55. Freq\_Body\_Accel\_Jerk\_StdDev\_Z
56. Freq\_Body\_Accel\_Jerk\_MeanFreq\_X
57. Freq\_Body\_Accel\_Jerk\_MeanFreq\_Y
58. Freq\_Body\_Accel\_Jerk\_MeanFreq\_Z
59. Freq\_Body\_Gyro\_Mean\_X
60. Freq\_Body\_Gyro\_Mean\_Y
61. Freq\_Body\_Gyro\_Mean\_Z
62. Freq\_Body\_Gyro\_StdDev\_X
63. Freq\_Body\_Gyro\_StdDev\_Y
64. Freq\_Body\_Gyro\_StdDev\_Z
65. Freq\_Body\_Gyro\_MeanFreq\_X
66. Freq\_Body\_Gyro\_MeanFreq\_Y
67. Freq\_Body\_Gyro\_MeanFreq\_Z
68. Freq\_Body\_Accel\_Magnitude\_Mean
69. Freq\_Body\_Accel\_Magnitude\_StdDev
70. Freq\_Body\_Accel\_Magnitude\_MeanFreq
71. Freq\_Body\_Accel\_Jerk\_Magnitude\_Mean
72. Freq\_Body\_Accel\_Jerk\_Magnitude\_StdDev
73. Freq\_Body\_Accel\_Jerk\_Magnitude\_MeanFreq
74. Freq\_Body\_Gyro\_Magnitude\_Mean
75. Freq\_Body\_Gyro\_Magnitude\_StdDev
76. Freq\_Body\_Gyro\_Magnitude\_MeanFreq
77. Freq\_Body\_Gyro\_Jerk\_Magnitude\_Mean
78. Freq\_Body\_Gyro\_Jerk\_Magnitude\_StdDev
79. Freq\_Body\_Gyro\_Jerk\_Magnitude\_MeanFreq
