---
title: "CodeBook.md"
output: html_document
---

#Instructions
The instructions for this particular assignment are as follows:

You shold create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately lables the data set with descriptive variable names
5. From the data set in step 4, creates a second, indepedent tidy data set with the average of each variable for each activity and each subject

#The Data
There are a number of characteristics within this data set. A couple of the high level characteristics are as follows:

1. Data Set Characterisctics: Multivariate, Time-Series
2. Attribute Characteristics: N/A
3. Associated Tasks: Calssification, Clustering
4. Number of Instances: 10299
5. Number of Attributes: 561
6. Missing Values?: N/A
7. Area: Computer
8. Date Donated: 12/10/2012
9. Number of web hits: 136466

##Data Set Information
The experiments for this data set were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities: 

1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying

all while wearing a smartphone (Samsung Galaxy S Smartphone) on the waist. The experiment uses the embedded accellerometer and gyroscope. 

##Data Information
The data itself is contained in a .zip file when extracted contains a number of .txt files that were used for analysis. A Fast Fourier Transform was applied to varioius signals producing fBodyAcc-XYZ, fBodyACCjerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGryoJerkMag

These signals were used to estimate variables of the feature vector for each pattern:

1. tBodyAcc-XYZ
2. tGravityAcc-XYZ
3. tBodyAccJerk-XYZ
4. tBodyGyro-XYZ
5. tBodyGyroJerk-XYZ
6. TBodyAccMag
7. tGravityAccMag
8. tBodyAccJerkMag
9. tBodyGyroMag
10. tBodyGyroJerkMag
11. fBodyAcc-XYZ
12. fBodyAccJerk-Xyz
13. fBodyGyro-XYZ
14. fBodyAccMag
15. fBodyAccJerkMag
16. fBodyGyroMag
17. fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

1. mean():Mean Value
2. std():Standard Deviation
3. mad(): Median absolute deviation
4. max(): Largest value in array
5. min(): Smallest value in array
6. sma(): Signal magnitude area
7. Energy(): Energy measure. Sum of the squares divided by the number of values
8. iqr(): Interqueartile range
9. entropy(): Signal entropy
10. arCoeff(): Autoregresion coefficients with Burg order equal to 4
11. correlation(): Correlation coefficient between two signals 