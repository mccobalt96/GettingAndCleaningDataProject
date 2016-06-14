# GettingAndCleaningDataProject

##Final project for the Getting and Cleaning Data course

This is the course project for the Getting and Cleaning Data Coursera course.

Data Files

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

The R script, `run_analysis.R`, does the following:

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
