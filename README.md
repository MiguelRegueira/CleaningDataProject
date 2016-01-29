#Cleaning Data Project

This repository contains the solution to assignment Getting and Cleaning Data Course Project from Coursera Data Cleaning.

----------


##Introduction

This project is created to performed the following actions over the dataset **Human Activity Recognition Using Smartphones Dataset**<sup>1</sup>: 
<ol>
<li> Merges the training and the test sets to create one data set. </li>
<li> Extracts only the measurements on the mean and standard deviation for each measurement.</li>
<li> Uses descriptive activity names to name the activities in the data set</li>
<li> Appropriately labels the data set with descriptive variable names.</li>
<li> From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.</li>

##Files
In the repository can be found the following files:
* <b>run_analysis.R</b>: This is the main R script that will download the dataset, process it, merge and clean the data and generate a copy of the resulting data in the files.
* <b>tidyDataset.txt</b>: The resulting dataset upto step 4.
* <b>averageTidyDataset.txt</b>: The resulting data set of step 5 with the average of each variable for each activity and each user.
* <b>CodeBook.md</b>: It describes the variables, the data, and any transformations or work that you performed to clean up the dataset.

##Usage
When executed run_analisys.R will create a folder in current working directory called data, where it will download the raw dataset. The downloaded data will be read and process to generate the resulting dataset and creating a copy of it in current working directory file tidyDataset.txt. Finally the dataset is processed to get the average for each variable for each usera and each subject and the result is stored in file averageTidyDataset.txt.

<sup>1</sup> The dataset contains the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. More information on www.smartlab.ws
