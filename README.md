# Getting and Cleaning Data Course Project

## Project Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for later analysis. This repository contains the following files:

- **run_analysis.R**: An R script that performs the data cleaning and transformation steps.
- **tidy_data.txt**: The final tidy dataset containing the average of each variable for each activity and each subject.
- **CodeBook.md**: A codebook describing the variables, data, and transformations applied to create the tidy dataset.
- **README.md**: This file, explaining the analysis files and their purpose.

## Data Source
The data used in this project is the "Human Activity Recognition Using Smartphones" dataset from the UCI Machine Learning Repository. It was downloaded from:  
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## How the Script Works
The `run_analysis.R` script performs the following steps:

1. Downloads and unzips the dataset to the working directory.
2. Merges the training and test datasets to create one dataset.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to label the activities in the dataset.
5. Appropriately labels the dataset with descriptive variable names.
6. Creates a second, independent tidy dataset (`tidy_data.txt`) with the average of each variable for each activity and each subject.

## How to Run the Analysis
1. Clone this repository to your local machine.
2. Open R or RStudio and set the working directory to the location of the repository.
3. Source the `run_analysis.R` script by running:
   ```R
   source("run_analysis.R")
   ```
4. The script will download the dataset, process it, and output the tidy dataset as `tidy_data.txt` in the working directory.

## Dependencies
The script requires the `dplyr` package in R for data manipulation. Install it using:
```R
install.packages("dplyr")
```

## Output
The final output is `tidy_data.txt`, a tidy dataset where:
- Each row represents a unique combination of subject and activity.
- Each column represents a variable (subject, activity, or an averaged measurement).
- The measurements are the averages of the mean and standard deviation features for each subject-activity combination.

For more details on the variables and transformations, refer to the `CodeBook.md` file.
