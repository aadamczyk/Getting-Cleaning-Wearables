library(plyr)
library(dplyr)
library(data.table)

### Read in the data to be modified

setwd("test/")
subject_test <- read.table("subject_test.txt")
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
setwd("..")

setwd("train/")
subject_train <- read.table("subject_train.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
setwd("..")

### Combine the train and test datasets and rename the variables to meaningful names

subject_master <- rbind(subject_train, subject_test)
subject_master <- dplyr::rename(subject_master, subject_number=V1)

x_master <- rbind(x_train, x_test)
old_x_names <- names(x_master)
feature_names <- read.table("features.txt") #Pull the feature names from the separate file
feature_names <- mutate(feature_names, features_characters= as.character(V2))
#Replace the variable names with meaningful names
x_master <- setnames(x_master, old_x_names, feature_names$features_characters)

y_master <- rbind(y_train, y_test)
y_master <- dplyr::rename(y_master, activity_number=V1)
y_master <- mutate(y_master, activity= as.factor(activity_number))
activity_labels <- read.table("activity_labels.txt") #Pull the activity names from the separate file
activity_labels <- dplyr::rename(activity_labels, activity_names=V2)
levels(y_master$activity) <- activity_labels$activity_names #set activity names as levels in a factor

### Create a single datafile for subject number, activity, and measurement files

#Only bring the factor version (column2) from the activity file
master_data <- cbind(subject_master, y_master[2], x_master) 

### Find all the variables that are mean or standard deviations

mean_indices <- grep("mean[^F]", feature_names$features_characters)
sd_indices <- grep("std", feature_names$features_characters)
all_indices <- c(mean_indices, sd_indices)
#Shift indices up 2 because added 2 new columns to master data (subject number and activity)
all_indices <- all_indices+2

### Only select the mean and standard deviation variables
summary_data <- master_data[,c(1,2,all_indices)] #also columns 1&2 (subject number and activity)

### Group data by subject and activity and find the average for each

grouped_data <- group_by(summary_data, subject_number, activity)
grouped_summary <- summarise_each(grouped_data, funs(mean))

### Save the tidy data

write.table(grouped_summary, "Tidy_Wearable_Data.txt", row.names=FALSE)
