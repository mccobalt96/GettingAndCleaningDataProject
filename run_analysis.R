## X_testData is the table containing data from ./test/X_test.txt file.  This file contains all of
## the results from the test group (2947 observations and 561 variables).  

## Read the columns in as class = double

X_testData <- read.table("./test/X_test.txt", header = FALSE, colClasses = "double")

## Read in the features.txt table

featuresDATA <- read.table("features.txt",header=FALSE)

## eliminate special characters in the future names

featuresDATA$V2 <- gsub("[[:punct:]]","",featuresDATA$V2)

## rename columns now

names(X_testData) <- featuresDATA[,2]

## Create a new table containing only columns where the features include mean|std|Mean

X_testData2 <- X_testData[, grep("mean|std|Mean", featuresDATA$V2)]

##  The Y_test.txt file contains the activities associated with the data.  Specify the new
##  column name to be ActivityID for clarity.

Y_testData <- read.table("./test/Y_test.txt", header = FALSE, col.names = "ActivityID")

## Replace ActivityID codes with meaningful terms

Y_testData$ActivityID[Y_testData$ActivityID == 1] <- "WALKING"
Y_testData$ActivityID[Y_testData$ActivityID == 2] <- "WALKING_UPSTAIRS"
Y_testData$ActivityID[Y_testData$ActivityID == 3] <- "WALKING_DOWNSTAIRS"
Y_testData$ActivityID[Y_testData$ActivityID == 4] <- "SITTING"
Y_testData$ActivityID[Y_testData$ActivityID == 5] <- "STANDING"
Y_testData$ActivityID[Y_testData$ActivityID == 6] <- "LAYING"

##  Now process the train data.

X_trainData <- read.table("./train/X_train.txt", header = FALSE, colClasses = "double")

## rename columns now

names(X_trainData) <- featuresDATA[,2]

## Create a new table containing only columns where the features include mean|std|Mean

X_trainData2 <- X_trainData[, grep("mean|std|Mean", featuresDATA$V2)]

## Now process the activityIDs for the train data

Y_trainData <- read.table("./train/Y_train.txt", header = FALSE, col.names = "ActivityID")

## Replace ActivityID codes with meaningful terms

Y_trainData$ActivityID[Y_trainData$ActivityID == 1] <- "WALKING"
Y_trainData$ActivityID[Y_trainData$ActivityID == 2] <- "WALKING_UPSTAIRS"
Y_trainData$ActivityID[Y_trainData$ActivityID == 3] <- "WALKING_DOWNSTAIRS"
Y_trainData$ActivityID[Y_trainData$ActivityID == 4] <- "SITTING"
Y_trainData$ActivityID[Y_trainData$ActivityID == 5] <- "STANDING"
Y_trainData$ActivityID[Y_trainData$ActivityID == 6] <- "LAYING"

##  Now load the subject data from subject_test.txt

Z_Subject_Test_Data <- read.table("./test/subject_test.txt", header = FALSE, col.names = "SubjectID")

##  Now load the subject data from subject_train.txt

Z_Subject_Train_Data <- read.table("./train/subject_train.txt", header = FALSE, col.names = "SubjectID")

## Combine the subjectID, activityID, and data files for test and train

new_X_testData <- cbind(Z_Subject_Test_Data, Y_testData, X_testData2)
new_X_trainData <- cbind(Z_Subject_Train_Data, Y_trainData, X_trainData2)

## merge the two data files 

mergedData <- merge(new_X_testData,new_X_trainData,all=TRUE)

## now use reshape2 / melt & dcast to do the means of the columns for the subjects and activities
## for all the variables.

require(reshape2)

## this is a list of all the variables except for SubjectID and ActivityID

measure_variables <- names(mergedData)[3:88]

## melt the data

meltdata <- melt(mergedData, id=c("SubjectID","ActivityID"), measure.vars = measure_variables)

## use dcast to compute the means.  The variables we want to keep are SubjectID and
## ActivityID.  

tidydata   = dcast(meltdata, SubjectID + ActivityID ~ variable, mean)

## output the data to a file

write.table(tidydata, file = "./tidy_dataset.txt", row.names = FALSE)
