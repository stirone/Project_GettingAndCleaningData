#
# run_analysis.R
#   Collect and prepare a tidy data set.  Project submission for 
#   Coursera class Getting and Cleaning Data.
#

  # download the data we are going to work with. It is a zip file, so unzip it to
  # our current working directory also.

  # this is the file
  fileUrl <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"

  # download it
  print("Downloading file...")
  download.file(fileUrl, destfile="./UCI_DATA.zip")   # renaming it for convenience
  print("done.")
  
  # unzip it.  It unzips to a subdirectory called "UCI HAR Dataset"
  print("Unzipping file...")
  unzip(zipfile="./UCI_DATA.zip")
  print("done.")
  
  # now let's start working with the files...
  
  #
  # LEGENDS (aka LABELS)
  #
  
  # get the activity legend, i.e., the activity key and its corresponding activity as a text string.
  activity_LABELS <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("activity_key", "activity"))

  # get the feature legend, i.e., the feature key and its corresponding feature as a text string.
  feature_LABELS <- read.table("./UCI HAR Dataset/features.txt", col.names = c("feature_key", "feature"))
  
  #
  # TRAINING DATA
  #
  print("Reading in training data...")
  
  # load the TRAINING activity data, i.e., what activity was being done for each row of feature data
  print("...activities...")
  activity_TRAINING <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity_key"))
  
  # create a more readable version of that by replacing the numeric key with its corresponding activity label.
  #   I used match instead of merge so that the data didn't get reordered in any way.
  activity_COL_TRAINING <- activity_LABELS[match(activity_TRAINING[ ,1], activity_LABELS[ ,1]), 2]
  
  # read in the training subject data, i.e., what subject was doing the activity for each row of feature data
  print("...subjects...")
  subject_TRAINING  <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
  
  # read in the feature data collected, labeling the columns per the rows in the feature table, since
  #  row 1 corresponds to column 1 of the features, row 2 of features.txt = col 2 of x_train/test, etc.
  #  also, use check.names=FALSE to preserve the special characters in the column names (like hyphens, parens)
  print("...features...")
  features_TRAINING <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=feature_LABELS[,2], check.names=FALSE)
  
  # finally, create a training data set by column binding the subject, activity,
  # and feature data. 
  
  # It is important to note that we can do this because the data in the
  # different files are all in the same order, i.e., row 3 in the subject file
  # (subject_train/test.txt) is the subject associated with the features in 
  # row 3 of the feature file (x_train/test.txt), and likewise, row 3 of the
  # activity file (y_train/test.txt) is the activity associated with the
  # features in row 3 of the feature file.  And, we have not reordered the data in any way.
  
  # I decided to prefix subject and activity to the features.  
  features_TRAINING <- cbind(subject_TRAINING, "activity" = activity_COL_TRAINING, features_TRAINING)
  print("done.")
  
  
  #
  # TESTING DATA
  #
  # do the same as above with the testing data. leaving out the comments here (see above for explanation)
  #
  print("Reading in testing data...")
  
  print("...activities...")
  activity_TEST <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity_key"))

  print("...subjects...")
  subject_TEST  <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))

  print("...features...")
  features_TEST <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=feature_LABELS[,2], check.names=FALSE)

  activity_COL_TEST <- activity_LABELS[match(activity_TEST[ ,1], activity_LABELS[,1]),2]

  features_TEST <- cbind(subject_TEST, "activity" = activity_COL_TEST, features_TEST)
  print("done.")
  
  
  #
  # COMBINED DATA
  #
  # to create one data set I just appended the two.
  #
  print("Combining training and testing data...")
  features_ALL <- rbind(features_TRAINING, features_TEST)

  # let's remove some of the bigger objects we don't need anymore, in order to conserve memory
  rm(activity_TRAINING)
  rm(subject_TRAINING)
  rm(features_TRAINING)
  rm(activity_TEST)
  rm(subject_TEST)
  rm(features_TEST)
  
  print("done.")
  
  #
  # REDUCED DATA
  #
  # "extract only the measurements on the mean and stdev".  We do this by 
  #  finding the columns with "mean()" and "std()" in their names.
  #
  print("Extracing out the mean and std features...")
  mean_cols <- grep("mean\\(\\)" , feature_LABELS[,2])   # find the mean columns
  std_cols  <- grep("std\\(\\)"  , feature_LABELS[,2])   # find the std columns
  
  # combine and sort them, in order to preserve the original order
  desired_cols <-  sort( c(mean_cols, std_cols) )
  
  # add 2 to every value, since we prefixed two columns (subject, activity) to the feature data
  desired_cols <- desired_cols + 2     
  
  # finally, include those two columns (1 and 2) in the list of desired columns.
  # We now have a complete list of desired columns.
  desired_cols <- c(1,2,desired_cols)  

  # now extract out those desired columns from the feature data
  desired_features <- features_ALL[,desired_cols]
  print("done.")
  
  # 
  # TRANSFORMED DATA
  # 
  # now get the mean of these columns for each activity and each subject
  # 
  # To do this I used the plyr package. This will load it, if necessary.

  print("Using plyr package to compute the mean of the extracted features...")
  x <- find.package("plyr")  # will raise an error if not installed.
  #  use install.packages("plyr") to get this package
  library(plyr)
  
  # I used ddply to create a new data.frame with the mean by subject and
  # activity of every column (colwise) beyond the subject and activity columns.

  xformed_features <- ddply(desired_features, .(subject, activity), colwise(mean))
  print("done.")
  
  # lets change the column names to show how we transformed the measurements.
  #  we will prefix the given column names with "mean_of_".  
  colnames(xformed_features) <- paste(c("mean_of_") , colnames(xformed_features) ,sep="")

  # well, except the first two, keep those the same (have to redo them here)
  colnames(xformed_features)[1] = "subject"
  colnames(xformed_features)[2] = "activity"
  
  # output the result as a tab-delimited text file (omit the numeric row that is normally output)
  write.table(xformed_features, "run_analysis_output.txt", row.names=FALSE, sep="\t")

  # and we are done.
  print("Done with data set creation; output file is a tab-delimited text file named 'run_analysis_output.txt'.")
  
  
