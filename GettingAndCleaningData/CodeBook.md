
The data is a summarized version of observations noted from the gyroscope and accelerometer from a smartphone(Samsung Galay S II) with a group of 30 volunteers within an age bracket of 19-48 years, who worn the phone on waist. Each of them performed six activities viz.WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING. Various kind of measurements were done from inbuilt accelerometer and gyroscope in the device.
Following are the files of the original data
1. activity_labels.txt :- this contains the six activites with labels(numbered 1-6).
2. features.txt        :- this contains the set of variables for the measurement, numbered 1 to 561.
3. 'train/X_train.txt' :- Training set.
4. 'train/y_train.txt' :- Training labels.
5. 'test/X_test.txt'   :- Test set.
6. 'test/y_test.txt'   :- Test labels.

Refer to 'features_info.txt' for complete understanding of variables. The variables are summarised here
tBodyAcc-XYZ     :Body Accerleration Data from Accelerometer, in all three directions(X,Y and Z).'t' denotes observations in time domain
tGravityAcc-XYZ  :Body Gravitational Accerleration data
tBodyAccJerk-XYZ :Body Jerk(rate of change of acceleration) data from Accelerometer
tBodyGyro-XYZ    :Body Angular Velocity Data from Gyroscope, in all three directions, 't' denoting time domain
tBodyGyroJerk-XYZ:Body Jerk(rate of change of angular velocity) data from Gyrscope
tBodyAccMag      :Body Acceleration magnitude data from accelerometer, calculated from all three tBodyAcc-X,Y and Z
tGravityAccMag   :Body Gravitational Acceleration magnitude data from accelerometer
tBodyAccJerkMag  :Body Jerk magnitude data from accelerometer
tBodyGyroMag     :Body Angular Velocity magnitude data from Gyroscope
tBodyGyroJerkMag :Body Jerk magnitude data from Gyroscope
fBodyAcc-XYZ     :Body Accerleration Data from Accelerometer, observation in frequency domain
fBodyAccJerk-XYZ :Body Jerk Data from Accelerometer, observation in frequency domain
fBodyGyro-XYZ    :Body Angular Velocity Data from Gyroscope, observation in frequency domain
fBodyAccMag      :Body Acceleration magnitude data from accelerometer, calculated from all three tBodyAcc-X,Y and Z, observation in frequency domain
fBodyAccJerkMag  :Body Jerk magnitude data from accelerometer, observation in frequency domain
fBodyGyroMag     :Body Angular Velocity magnitude data from Gyroscope, observation in frequency domain
fBodyGyroJerkMag :Body Jerk magnitude data from Gyroscope

For each of the above variables, the below statistical oberservations have been mentioned in the data(directly taken from 'features_info.txt')
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
angle(): Angle between to vectors.
Following two observations specific only to time signals('tBody' prefix):
-arCoeff(): Autorregresion coefficients with Burg order equal to 4
-correlation(): correlation coefficient between two signals
Following observations specific only to frequency signals('fBody' prefix):
-maxInds(): index of the frequency component with largest magnitude
-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
-skewness(): skewness of the frequency domain signal 
-kurtosis(): kurtosis of the frequency domain signal 
-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window. 

The data can be downloaded from here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The files contained in the repository are as follows:
1. TidyData.txt :- combined and cleaned version of the original data.
2. ReadMe.md    :- A guide to the functioning of 'run_analysis.R'
3. CodeBook.md  :- This document itself.

In 'tidydata.txt' the Activity labels and subjects numbers have been combined with the given x data as additional 'columns', while the features are merged as column names. Further, the training data('x_train.txt') and test data('x_test.txt') have been combined to create one data. All these operations are coded in the R-script 'run_analysis.R'. Running the script while being in the same folder as with 'UCI HAR Dataset', will return the text file 'tidydata.txt' in the same folder.
 
The variables in 'TidyData.txt' are described below:-

Activity                          :Denotes the six kind of activities performed by subjects. These are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING
SubjectNumber                     :The subjects involved in experiment. Denoted by numbers 1 to 30

The variables that follow are subset of the original data variables, where only statistical operation of mean() and standard deviation(std()) has been considered. 'MEANOF_' denotes that the readings are averaged per subject.

MEANOF_tBodyAcc-mean()-X          :mean of body acceleration in x, further averaged per subject
MEANOF_tBodyAcc-mean()-Y          :mean of body acceleration in y, further averaged per subject
MEANOF_tBodyAcc-mean()-Z          :mean of body acceleration in z, further averaged per subject
MEANOF_tBodyAcc-std()-X           :standard deviation of body acceleration in x, further averaged per subject
MEANOF_tBodyAcc-std()-Y           :standard deviation of body acceleration in y, further averaged per subject
MEANOF_tBodyAcc-std()-Z           :standard deviation of body acceleration in z, further averaged per subject
MEANOF_tGravityAcc-mean()-X       :mean of tGravityAcc in x, further averaged per subject
MEANOF_tGravityAcc-mean()-Y       :mean of tGravityAcc in y, further averaged per subject
MEANOF_tGravityAcc-mean()-Z       :mean of tGravityAcc in z, further averaged per subject
MEANOF_tGravityAcc-std()-X        :standard deviation of tGravityAcc in x, further averaged per subject
MEANOF_tGravityAcc-std()-Y        :standard deviation of tGravityAcc in y, further averaged per subject
MEANOF_tGravityAcc-std()-Z        :standard deviation of tGravityAcc in z, further averaged per subject
MEANOF_tBodyAccJerk-mean()-X      :mean of tBodyAccJerk in x, further averaged per subject
MEANOF_tBodyAccJerk-mean()-Y      :mean of tBodyAccJerk in y, further averaged per subject
MEANOF_tBodyAccJerk-mean()-Z      :mean of tBodyAccJerk in z, further averaged per subject
MEANOF_tBodyAccJerk-std()-X       :standard deviation of tBodyAccJerk in x, further averaged per subject
MEANOF_tBodyAccJerk-std()-Y       :standard deviation of tBodyAccJerk in y, further averaged per subject
MEANOF_tBodyAccJerk-std()-Z       :standard deviation of tBodyAccJerk in z, further averaged per subject
MEANOF_tBodyGyro-mean()-X         :mean of tBodyGyro in x, further averaged per subject
MEANOF_tBodyGyro-mean()-Y         :mean of tBodyGyro in y, further averaged per subject
MEANOF_tBodyGyro-mean()-Z         :mean of tBodyGyro in z, further averaged per subject
MEANOF_tBodyGyro-std()-X          :standard deviation of tBodyGyro in x, further averaged per subject
MEANOF_tBodyGyro-std()-Y          :standard deviation of tBodyGyro in y, further averaged per subject
MEANOF_tBodyGyro-std()-Z          :standard deviation of tBodyGyro in z, further averaged per subject
MEANOF_tBodyGyroJerk-mean()-X     :mean of tBodyGyroJerk in x, further averaged per subject
MEANOF_tBodyGyroJerk-mean()-Y     :mean of tBodyGyroJerk in y, further averaged per subject
MEANOF_tBodyGyroJerk-mean()-Z     :mean of tBodyGyroJerk in z, further averaged per subject
MEANOF_tBodyGyroJerk-std()-X      :standard deviation of tBodyGyroJerk in x, further averaged per subject
MEANOF_tBodyGyroJerk-std()-Y      :standard deviation of tBodyGyroJerk in y, further averaged per subject
MEANOF_tBodyGyroJerk-std()-Z      :standard deviation of tBodyGyroJerk in z, further averaged per subject
MEANOF_tBodyAccMag-mean()         :mean of tBodyAccMag, further averaged per subject
MEANOF_tBodyAccMag-std()          :standard deviation of tBodyAccMag, further averaged per subject
MEANOF_tGravityAccMag-mean()      :mean of tGravityAccMag, further averaged per subject
MEANOF_tGravityAccMag-std()       :standard deviation of tGravityAccMag, further averaged per subject
MEANOF_tBodyAccJerkMag-mean()     :mean of tBodyAccJerkMag, further averaged per subject
MEANOF_tBodyAccJerkMag-std()      :standard deviation of tBodyAccJerkMag, further averaged per subject
MEANOF_tBodyGyroMag-mean()        :mean of tBodyGyroMag, further averaged per subject
MEANOF_tBodyGyroMag-std()         :standard deviation of tBodyGyroMag, further averaged per subject
MEANOF_tBodyGyroJerkMag-mean()    :mean of tBodyGyroJerkMag, further averaged per subject
MEANOF_tBodyGyroJerkMag-std()     :standard deviation of tBodyGyroJerkMag, further averaged per subject
MEANOF_fBodyAcc-mean()-X          :mean of fBodyAcc in x, further averaged per subject
MEANOF_fBodyAcc-mean()-Y          :mean of fBodyAcc in y, further averaged per subject
MEANOF_fBodyAcc-mean()-Z          :mean of fBodyAcc in z, further averaged per subject
MEANOF_fBodyAcc-std()-X           :standard deviation of fBodyAcc in x, further averaged per subject
MEANOF_fBodyAcc-std()-Y           :standard deviation of fBodyAcc in y, further averaged per subject
MEANOF_fBodyAcc-std()-Z           :standard deviation of fBodyAcc in z, further averaged per subject
MEANOF_fBodyAccJerk-mean()-X      :mean of fBodyAccJerk in x, further averaged per subject
MEANOF_fBodyAccJerk-mean()-Y      :mean of fBodyAccJerk in y, further averaged per subject
MEANOF_fBodyAccJerk-mean()-Z      :mean of fBodyAccJerk in z, further averaged per subject
MEANOF_fBodyAccJerk-std()-X       :standard deviation of fBodyAccJerk in x, further averaged per subject
MEANOF_fBodyAccJerk-std()-Y       :standard deviation of fBodyAccJerk in y, further averaged per subject
MEANOF_fBodyAccJerk-std()-Z       :standard deviation of fBodyAccJerk in z, further averaged per subject
MEANOF_fBodyGyro-mean()-X         :mean of fBodyGyro in x, further averaged per subject
MEANOF_fBodyGyro-mean()-Y         :mean of fBodyGyro in y, further averaged per subject
MEANOF_fBodyGyro-mean()-Z         :mean of fBodyGyro in z, further averaged per subject
MEANOF_fBodyGyro-std()-X          :standard deviation of fBodyGyro in x, further averaged per subject
MEANOF_fBodyGyro-std()-Y          :standard deviation of fBodyGyro in y, further averaged per subject  
MEANOF_fBodyGyro-std()-Z          :standard deviation of fBodyGyro in z, further averaged per subject
MEANOF_fBodyAccMag-mean()         :mean of fBodyAccMag, further averaged per subject
MEANOF_fBodyAccMag-std()          :standard deviation of fBodyAccMag, further averaged per subject
MEANOF_fBodyBodyAccJerkMag-mean() :mean of fBodyAccJerkMag, further averaged per subject
MEANOF_fBodyBodyAccJerkMag-std()  :standard deviation of fBodyAccJerkMag, further averaged per subject
MEANOF_fBodyBodyGyroMag-mean()    :mean of fBodyGyroMag, further averaged per subject
MEANOF_fBodyBodyGyroMag-std()     :standard deviation of fBodyGyroMag, further averaged per subject
MEANOF_fBodyBodyGyroJerkMag-mean():mean of fBodyGyroJerkMag, further averaged per subject
MEANOF_fBodyBodyGyroJerkMag-std() :standard deviation of fBodyGyroJerkMag, further averaged per subject