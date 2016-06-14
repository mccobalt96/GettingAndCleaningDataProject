# GettingAndCleaningDataProject
Final project for the Getting and Cleaning Data course

This is the course project for the Getting and Cleaning Data Coursera course.

The R script, `run_analysis.R`, does the following:
1.  Load data from the X_test.txt file which contains 2947 observations and 561 variables.
2.  Read in the feature info file.
3.  Eliminate special characters in the feature listing.
4.  Rename columns to meaningful names based on the feature listing.
5.  Read in the Y_test.txt file for activity information.
6.  Load data from the X_train.txt file which contains 7352 observations and 561 variables.
7.  Rename columns to meaningful names based on the feature listing.
8.  Read in the Y_train.txt file for activity information.
9.  Load the subject test & train data.
10.  Add the SubjectID's and ActivityIDs to the test and train data frames.
11.  Merge the test and train data frames.
12.  Use reshape2 / melt / dcast to compute means for the variables.
13.  Create a tidy dataset.

The end result is shown in the file `tidy.txt`.
