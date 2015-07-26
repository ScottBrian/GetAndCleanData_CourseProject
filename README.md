# GetAndCleanData_CourseProject
This Repo contains my course project for the Johns Hopkins University MOOC "Getting and Cleaning Data"

This README file describes the course project for the Johns Hopkins University MOOC "Getting and Cleaning Data". The project consist of starting with a provided data sets with several files, combining those files, and producing a tidy set set. 

The various files included are:
1. README.md - this file
2. run_analysis.R - the script that produced the tidy data set 
3. CodeBook.md - decribes the variables in the tidy data set

## run_analysis.R

The run_analysis.R script builds and returns a wide format tidy data frame with 180 rows and 81 columns. It starts by reading in the following files from the original data set provided for this project:
1. X_test.txt
2. y_test.txt
3. subject_test.txt
4. X_train.txt
5. y_train.txt
6. subject_train.txt
7. features.txt
8. activity_labels.txt
 
After reading in the files, the run_analysis.R script performs the following:
1. Using the features.txt file, create a column selection list as a subset of the columns in the
   x_test.txt and x_train.txt data sets. The subset is composed of thoses columns that represent
   means or standard deviations of the variables. 
2. Rename the selected column names in the columns selection list to be more descriptive and readable
3. Combine the test and train tables for the selected columns and rename the columns
4. Combine the subject and activity tables, and name the columns and activities
5. combine the big tables together, group by Subject_ID and Activity_ID, and summarize
   by mean to create and return the tidy data set

Note that in order to run the run_analysis.R script, the following must be done:
1. The Human Activity data set must be obtained from the following web address: 
       https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. After downloading the zip file, it must be unzipped and the top level folder "UCI HAR Dataset"
   must be placed in the working directory where the run_analysis.R script will be run

Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
 
  [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition
  on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
  Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
 
  This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or
  their institutions for its use or misuse. Any commercial use is prohibited.
 
  Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
