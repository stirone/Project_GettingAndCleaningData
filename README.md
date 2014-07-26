README
========================================================
This repository contains the project submission for Coursera course "Getting and Cleaning Data".

The project requirements can be summarized as follows:

>You should create one R script called run_analysis.R that does the following. 

>1. Merges the training and the test sets to create one data set.

>2. Extracts only the measurements on the mean and standard deviation for each measurement. 

>3. Uses descriptive activity names to name the activities in the data set

>4. Appropriately labels the data set with descriptive variable names. 

>5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
>

The training and test data sets referred to above are training and test data found in the UCI HAR dataset, downloaded from the URL in the script.


As instructed, there is only one script used for this project, run_analysis.R. That script downloads the 
desired dataset, transforms it, and outputs the results to a text file.  The contents of the output file
are described in the CodeBook.md file.  

***Important*** The script utilizes the plyr package. Use `install.packages("plyr")` to install that package, if necessary.


The script was extensively commented for documentation purposes.

