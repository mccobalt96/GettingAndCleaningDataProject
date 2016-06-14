# GettingAndCleaningDataProject
##Final project for the Getting and Cleaning Data course

###This is the course project for the Getting and Cleaning Data Coursera course.

###The R script, `run_analysis.R`, does the following:
* Load data from the X_test.txt file which contains 2947 observations and 561 variables.
* Read in the feature info file.
* Eliminate special characters in the feature listing.
* Rename columns to meaningful names based on the feature listing.
* Read in the Y_test.txt file for activity information.
* Load data from the X_train.txt file which contains 7352 observations and 561 variables.
* Rename columns to meaningful names based on the feature listing.
* Read in the Y_train.txt file for activity information.
* Load the subject test & train data.
* Add the SubjectID's and ActivityIDs to the test and train data frames.
* Merge the test and train data frames.
* Use reshape2 / melt / dcast to compute means for the variables.
* Create a tidy dataset.

The end result is shown in the file `tidy.txt`.
