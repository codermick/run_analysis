<h1> The run_analysis.R script does the following: <h1>
-	Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set.
-	Appropriately labels the data set with descriptive activity names.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
<h2> To achieve this do the following: <h2>
-	Set the working directory for  the run_analysis.R script to the UCI HAR Dataset.
-	Run the run_analysis.R script
<h2> How the run_analysis.R script works <h2>
-	Sets the path to the UCI HAR Dataset.
-	Loads and cleans the data to create the tidy data.
-	Selects only the mean and std features.
-	Calculates the mean of each variable, aggregating over activity and subject.
-	Writes the result data frame to .txt files in the UCI HAR Dataset direcetory as samsungtidy.txt
