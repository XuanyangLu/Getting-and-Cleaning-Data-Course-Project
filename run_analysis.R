# Download and unzip data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip")
# Read data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
# Merge data
all_data <- rbind(train_data, test_data)
all_subjects <- rbind(train_subject, test_subject)
all_labels <- rbind(train_labels, test_labels)
colnames(all_subjects) <- "subject"
colnames(all_labels) <- "activity"
# Extract mean and standard deviation
features <- read.table("UCI HAR Dataset/features.txt")
colnames(all_data) <- features$V2
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", features$V2)
all_data <- all_data[, mean_std_cols]
# Name activities
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
all_labels$activity <- factor(all_labels$activity, levels = activity_labels$V1, labels = activity_labels$V2)
# Clean variable names
colnames(all_data) <- gsub("\\(\\)", "", colnames(all_data))
colnames(all_data) <- gsub("-", "_", colnames(all_data))
# Merge all data
final_data <- cbind(all_subjects, all_labels, all_data)
# Create tidy dataset
library(dplyr)
tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean)
# Save results
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)
