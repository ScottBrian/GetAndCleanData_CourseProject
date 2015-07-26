#######################################################################################################################
# 
# Function name: run_anaysis
#
# Purpose:    Returns a tidy data set showing the means of selected variables in the Human Activity data set
#             broken out by subject and activity
#
# Input: The following files from the Human Activity data set:
#           1) X_test.txt
#           2) y_test.txt
#           3) subject_test.txt
#           4) X_train.txt
#           5) y_train.txt
#           6) subject_train.txt
#           7) features.txt
#           8) activity_labels.txt
#
# Processing: 1) Read all files into storage
#             2) Using the features.txt file, create a column selection list as a subset of the columns in the
#                x_test.txt and x_train.txt data sets. The subset is composed of thoses columns that represent
#                means or standard deviations of the variables. 
#             3) Rename the selected column names in the columns selection list to be more descriptive and readable
#             4) Combine the test and train tables for the selected columns and rename the columns
#             5) Combine the subject and activity tables, and name the columns and activities
#             6) combine the big tables together, group by Subject_ID and Activity_ID, and summarize
#                by mean to create and return the tidy data set
#
# Output: a tidy data set in the wide format as a data frame with 180 rows and 81 columns
#
# Notes: 1) The Human Activity data set must be obtained from the following web address: 
#           https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#        2) After downloading the zip file, it must be unzipped and the top level folder "UCI HAR Dataset"
#           must be placed in the working directory where this function will be run
#
#        3) Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
#
# [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition
# on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
# Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
#
# This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or
# their institutions for its use or misuse. Any commercial use is prohibited.
#
# Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
#
#######################################################################################################################
run_analysis <- function() {

  library(data.table)
  library(plyr)
  library(dplyr)
  #
  # Read all files into storage from the Human Activity data set
  #
  x_test <- tbl_dt(read.table("./UCI HAR Dataset/test/X_test.txt"))
  activity_test <- tbl_dt(read.table("./UCI HAR Dataset/test/y_test.txt"))
  subject_test <- tbl_dt(read.table("./UCI HAR Dataset/test/subject_test.txt"))
  x_train <- tbl_dt(read.table("./UCI HAR Dataset/train/X_train.txt"))
  activity_train <- tbl_dt(read.table("./UCI HAR Dataset/train/y_train.txt"))
  subject_train <- tbl_dt(read.table("./UCI HAR Dataset/train/subject_train.txt"))
  cols_to_use <- tbl_dt(read.table("./UCI HAR Dataset/features.txt",header=FALSE))
  setnames(cols_to_use,c("col_num","col_name"))
  activity_labels <- tbl_dt(read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE))
  setnames(activity_labels,c("activity_num","activity_name"))
  # 
  # create data table to be used to select mean and std dev columns, and rename them with more readable names 
  #
  cols_to_use <- filter(cols_to_use, grepl("-mean|-std",col_name)) # get only the mean and std dev columns
  cols_to_use[,"col_name"] <- sub("\\(\\)","",cols_to_use[,col_name]) # remove parens from column names
  cols_to_use[,"col_name"] <- sub("^t","Time_",cols_to_use[,col_name]) # change t to Time_
  cols_to_use[,"col_name"] <- sub("Acc","_Accel",cols_to_use[,col_name]) # change Acc to _Accel
  cols_to_use[,"col_name"] <- sub("-mean","_Mean",cols_to_use[,col_name]) #change -mean to _Mean
  cols_to_use[,"col_name"] <- sub("-std","_StdDev",cols_to_use[,col_name]) # change -std to _StdDev
  cols_to_use[,"col_name"] <- sub("Mag","_Magnitude",cols_to_use[,col_name]) # change Mag to _Magnitude
  cols_to_use[,"col_name"] <- sub("^f","Freq_",cols_to_use[,col_name]) # change f to Freq_
  cols_to_use[,"col_name"] <- sub("BodyBody","Body",cols_to_use[,col_name]) # change double Body to single Body
  cols_to_use[,"col_name"] <- sub("Jerk","_Jerk",cols_to_use[,col_name]) # put underscore in front of Jerk
  cols_to_use[,"col_name"] <- sub("Gyro","_Gyro",cols_to_use[,col_name]) # put underscore in front of Gyro
  cols_to_use[,"col_name"] <- gsub("-","_",cols_to_use[,col_name]) # replace any remaining dashes with underscores 
  #
  # combine the test and train tables for the selected columns and rename the columns
  #
  big_x_dt <- tbl_dt(bind_rows(select(x_test,cols_to_use[,col_num])
                              ,select(x_train,cols_to_use[,col_num])
                              ))
  setnames(big_x_dt,cols_to_use[,col_name])
  #
  # combine the subject and activity tables and name the columns 
  #
  big_sa_dt <- tbl_dt(bind_cols(bind_rows(subject_test,subject_train)
                               ,bind_rows(activity_test,activity_train)
                               ))
  setnames(big_sa_dt,c("Subject_ID","Activity_ID")) 
  #
  # name the activities as factors
  #
  big_sa_dt[,"Activity_ID"] <- factor(big_sa_dt[,Activity_ID]
                                     ,levels=activity_labels[,activity_num]
                                     ,labels=activity_labels[,activity_name]
                                     )
  #
  # combine the big tables together, group by Subject_ID and Activity_ID,
  # and summarize by mean to create and return the tidy data set 
  #
  out_tidy_dt <- big_sa_dt %>% bind_cols(big_x_dt) %>% group_by(Subject_ID,Activity_ID) %>%
                                  summarise_each(funs(mean)) %>% arrange(Subject_ID,Activity_ID)
}
