==================================================================
Getting and Cleaning Data Course Project
==================================================================
Based on data from the:
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
See information in the README file for the original research for information on the collection of data and modifications performed by the original team.

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

For each record it is provided:
======================================

- The subject number that completed the activity
- The name of the activity being completed
- The mean of each measurement for that subject and activity
- The standard deviation of each measurement for that subject and activity

The dataset includes the following files:
=========================================

- 'README.txt'

- 'Tidy_Wearable_Data.txt': The completed tidy dataset with the average for each variable for each subject and activity.

- 'run_analysis.R': The script to modify the original data from the Human Activity Recognition Using Smartphones Dataset into the tidy dataset.

- 'Codebook.txt': A description of each of the variables provided in the tidy dataset.

Description of the script:
=========================================

The run_analysis.R script merges the test and train data for each of the three datasets (subject numbers, activities, and measurements) and then merges these three datasets into a single dataset.

The script creates meaningful variable names for the complete dataset. By changing the activities variable to a factor it makes it easier to understand which activities are being performed for 
each observation than if they had been left as numerical data. The subject number and activities variables are renamed to be meaningful. The other variables were renamed based on the names provided
by the original research team. Although these names aren't possible as clear as they could be, they were sufficient for the original researchers and without additional information about their meaning
I wouldn't be able to create more meaningful variable names.

The script then selects only the variables that were means or standard deviations of the measurements. I choose not to include the meanFreq variables because I didn't believe those matched what the 
prompt was asking for, but a different intepretation there could lead my tables to have fewer variables than if other people interpreted that differently.

The script then groups all of the observations that have the same subject number and activity and takes the average for each variable. It is possible that other submissions could have taken the averages
for each subject separately from the averages for each activity, but that seemed like it could be less useful for the next step of analysis. Since we don't have a specific end use for this data
I think either would be acceptable.
