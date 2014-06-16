#1
train <- read.table("train/X_train.txt")
test <- read.table("test/X_test.txt")
A <- rbind(train, test)

train <- read.table("train/subject_train.txt")
test <- read.table("test/subject_test.txt")
B <- rbind(train, test)

train <- read.table("train/y_train.txt")
test <- read.table("test/y_test.txt")
C <- rbind(train, test)

#2
features <- read.table("features.txt")
meanstand <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
A <- A[, meanstand]
names(A) <- features[meanstand, 2]
names(A) <- gsub("\\(|\\)", "", names(A))
names(A) <- tolower(names(A))

