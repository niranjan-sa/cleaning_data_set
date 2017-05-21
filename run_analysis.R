##---------------------------------
## Processing Human activities
##     smartphones data set
##
## Niranjan Agnihotri
##---------------------------------

##load packages
library(dplyr)
library(tidyr)

##Step 1 - Merges the training and the test sets to create one data set.
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", nrows = 7352)
x_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))

train_data <- cbind(x_train, x_sub, y_train)

#test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", nrows = 2947)
x_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))

#combining the columns
test_data <- cbind(x_test, x_sub, y_test)


##Merge both train and test data sets
dataset <- rbind(train_data, test_data)



###Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
##Reading features

feature_list <- read.table("UCI HAR Dataset/features.txt", col.names = c("id", "name"))
features <- c(as.vector(feature_list[, "name"]), "subject", "activity")

##features with mean and stdev in name
features_flag_ids <- grepl("mean|std|subject|activity", features) & !grepl("meanFreq", features)

final_data <- dataset[, features_flag_ids]

###Step 3 - Give discriptive names to the activity
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("id", "name"))

for(i in 1:nrow(activities)) {
  final_data$activity[final_data$activity == activities[i, "id"]] <- as.character(activities[i, "name"])
}

#testing
#final_data$activity

### Step 4 - Appropriately labels the data set with descriptive variable names.

final_names <- features[features_flag_ids]

#testing
#length(final_names)
#dim(final_data)

#view feature names
final_names
#Making the names readable
final_names <- gsub("\\(\\)", "", final_names)
final_names <- gsub("Acc", "acceleration", final_names)
final_names <- gsub("Mag", "magnitude", final_names)
final_names <- gsub("^t(.*)$", "\\1_time", final_names)
final_names <- gsub("^f(.*)$", "\\1_frequency", final_names)

final_names <- gsub("BodyBody", "Body", final_names)

##assigning names to the features
names(final_data) <- final_names


###Create a new data set
head(final_data, 2)
tidy_data <- tbl_df(final_data)

library(reshape2)
melted <- melt(tidy_data, id.vars = c('activity', 'subject'))

grouped <- group_by(melted, activity, subject, variable)

summary <- summarise(grouped, mean = mean(value))

#write the data set to a file
write.table(summary, file = "tidy_data.txt", row.names = FALSE)

#################
#End of the script
