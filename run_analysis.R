#1 Merges the training and the test sets to create one data set.

train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
A <- rbind(train, test)

train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
B <- rbind(train, test)

train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
C <- rbind(train, test)

#2 Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("features.txt")
meanstand <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
A <- A[, meanstand]
names(A) <- features[meanstand, 2]
names(A) <- gsub("\\(|\\)", "", names(A))
names(A) <- tolower(names(A))

#3 Uses descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
C[,1] = activities[C[,1], 2]
names(C) <- "activity"

#4 Appropriately labels the data set with descriptive variable names. 

names(B) <- "subject"
clean <- cbind(B, C, A)
write.table(clean, "merged_data.txt")

#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(B)[,1]
numSubjects = length(unique(B)[,1])
numActivities = length(activities[,1])
numCols = dim(clean)[2]
result = clean[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    temp <- clean[clean$subject==s & clean$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(temp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "samsungtidy.txt")




