# CodeBook

## Variables description 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation

Accopaining the variables it is recorder the following informaiton:
* Activity: The activity performed while variables were recorder
* Subject: It identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

## Data process

The following is the steps perfomed to finally obtained the tidy data:
<ol>
<li>The dataset is downloaded and unzip in data folder.</li>
<li>The list of variables available is read from features.txt and only are kept those related to mean and sdt functions.</li>
<li>It is read the information to map the activity code to a more understandable value from file activity_labels.txt.</li>
<li>Data from test dataset is processed:</li>
<ol>
<li>Observations data is read from X_test.txt of variables already selected in step 2.</li>
<li>The list of activities is read from y_test.txt and mapped to the descripted name with information from step 3.</li>
<li>Activity data is appended to observations in column Activity.</li>
<li>Subjects who performed the measurements is read from subject_test.txt and appended to observations in column Subject.</li>
</ol>
<li>Data from train dataset is processed:</li>
<ol>
<li>Observations data is read from X_train.txt of variables already selected in step 2.</li>
<li>The list of activities is read from y_train.txt and mapped to the descripted name with information from step 3.</li>
<li>Activity data is appended to observations in column Activity.</li>
<li>Subjects who performed the measurements is read from subject_train.txt and appended to observations in column Subject.</li>
</ol>
<li>Data from step 4 (test) and step 5 (train) is merged.</li>
<li>This data is saved with function write.table() in file tidyDataset.txt.</li>
<li>Data is sumarized with average for each variable by activity and subject.</li>
<li>This aggregated data is saved in file averageTidyDataset.txt with function write.table().</li>

</ol>
