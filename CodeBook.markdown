# CodeBook for Tidy Data Set

## Data Source
The data used in this project is sourced from the **UCI Machine Learning Repository**, specifically the "Human Activity Recognition Using Smartphones" dataset. The dataset was collected from the accelerometers of the Samsung Galaxy S smartphone. The full dataset and its description can be found at:  
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The raw data was downloaded from:  
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Data Description
The dataset contains measurements from 30 subjects performing 6 different activities. The raw data includes accelerometer and gyroscope readings, which were processed to extract 561 features. For this project, only the features related to mean and standard deviation were retained, resulting in 66 variables (plus subject and activity identifiers).

### Variables in the Tidy Data Set
The final tidy dataset (`tidy_data.txt`) contains the following variables:

- **subject**: Integer, the ID of the subject (1 to 30).
- **activity**: Factor, the activity performed by the subject. Possible values are:
  - WALKING
  - WALKING_UPSTAIRS
  - WALKING_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING
- **Measurement variables (66 columns)**: These are the averages of the mean and standard deviation measurements for each subject and activity. The names of these variables are derived from the original feature names, cleaned for readability (e.g., parentheses removed, dashes replaced with underscores). Examples include:
  - tBodyAcc_mean_X: Average of the mean body acceleration in the X direction (time domain).
  - tBodyAcc_std_X: Average of the standard deviation of body acceleration in the X direction (time domain).
  - fBodyAcc_mean_X: Average of the mean body acceleration in the X direction (frequency domain).
  - fBodyAcc_std_X: Average of the standard deviation of body acceleration in the X direction (frequency domain).
  - (and similar for Y, Z directions, as well as gyroscope and other measurements).

The full list of measurement variables can be viewed in the `tidy_data.txt` file or by inspecting the column names of the final dataset in the R script.

### Units
- Acceleration measurements are in standard gravity units (`g`).
- Gyroscope measurements are in radians per second (`rad/s`).
- All measurement variables in the tidy dataset represent the **average** of the original measurements for each subject-activity combination.

## Data Transformations
The following steps were applied to the raw data to create the tidy dataset:

1. **Merging**: The training and test datasets were combined into a single dataset.
2. **Feature Selection**: Only the measurements containing `mean()` and `std()` were extracted (66 out of 561 features).
3. **Activity Naming**: Activity labels (1 to 6) were replaced with descriptive names (e.g., "WALKING", "SITTING").
4. **Variable Naming**: Variable names were cleaned by removing parentheses and replacing dashes with underscores for better readability.
5. **Summarization**: A tidy dataset was created by calculating the average of each measurement for each subject and each activity.

## Additional Notes
- The tidy dataset adheres to the principles of tidy data: each row represents one observation (subject-activity combination), and each column represents a variable.
- The script `run_analysis.R` performs all the above transformations and outputs the tidy dataset as `tidy_data.txt`.