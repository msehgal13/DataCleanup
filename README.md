# DataCleanup

This is a guide for the programming assignment of Data Cleanup. It contains the list of output and the step by step execution of the code to get the output

#Assignment
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. The goal of the assignment is to cleanup the provided data, merge the data sets into one and create a tidy dataset output containing the mean of the data variables collected by activity and subject

#List of Contents
* Readme - This file
* run_analysis.R - The code for reading the required data files and the code to get the desired output
* final_summary.txt - The output of the code in txt format. This output contains a tidy dataset of means of all the variables collected from accelerometers of Samsung Galaxy S
* CodeBook - Contains the details of the variables in the dataset.

#What this code does
1. Step 1 - Load the required libraries. For this assignment we require dply and tidyr libraries.
2. Step 2 - Specify the directory of the data set. This should be the directory where the provided data is kept.
3. Read the activity and features files. They contain information of the activities done to collect the data and the different data variables collected as pert of the exercise.
4. Read the test and train data sets - For both test and train, 3 types of data sets are read - Variable values, subjects for whom the data was collected and the flag to identify what kind of activity gave the data in each row
5. Combine all the test datasets and all the train datasets to create full data sets for train and test sets. In this code the datasets are combined using mutate function but cbind can also be used
6. Merge the acitivity labels into the two datasets. The key for the merge is acviity flag (number denotation of the activities). This creates a column to identify the activity (in words) for each data row.
7. Merge the train and test datasets into one using Rbind to add one below the other.
8. Select only those variables which are mean or std of the measurements in the list using select function with contains argument. Note: meanFreq is excluded as it is a different measurement.
9. Group the dataset from Step 8 by subject and activity (in words) using Group_by function
10. Summarize the dataset in a tidy table to show the mean of all the variables selected in Step 8 using Summarize_all function.
11. Write the final output to a text file using write.table. 