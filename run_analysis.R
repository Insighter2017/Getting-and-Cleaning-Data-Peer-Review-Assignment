# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script does the following:

# 1. Three tables need to be created
#Read each of the three files into temp variables
#rbind to combine the training and test data.

setwd("C:/Users/Shelby/DataScienceCoursera/DataScienceCoursera/WearableTech/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")

X1 <- read.table("train/X_train.txt")
X2 <- read.table("test/X_test.txt")

S1 <- read.table("train/subject_train.txt")
S2 <- read.table("test/subject_test.txt")

Y1 <- read.table("train/y_train.txt")
Y2 <- read.table("test/y_test.txt")

X <- rbind(X1, X2)
S <- rbind(S1, S2)
Y <- rbind(Y1, Y2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Use grep to find -mean and -std, then strip those patterns from the description.
# Perform text manipulations on indexed descriptions

features <- read.table("features.txt")
indices_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
	
	X <- X[, indices_features]
		names(X) <- features[indices_features, 2]
		names(X) <- gsub("\\(|\\)", "", names(X))
		names(X) <- tolower(names(X))


# 3. Tidy the activity names in the activity labels data set.

activities <- read.table("activity_labels.txt")

activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"  ##Apply name "subject" to the data table S
cleaned <- cbind(S, Y, X)
write.table(cleaned, "dataSet1_Mean_and_SD_Only.txt", row.name=FALSE) #write the file to your directory


# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
#This uses nested functions to produce a cleaned data set that includes the subject, the activity, mean and SD for each activity.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1

for (s in 1:numSubjects) {
for (a in 1:numActivities) {
result[row, 1] = uniqueSubjects[s]
result[row, 2] = activities[a, 2]
tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
row = row+1
}
}
write.table(result, "dataSet2_averages.txt", row.name=FALSE)
