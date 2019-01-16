This file explains the working of 'run_analysis.R'.

In 'tidydata.txt' the Activity labels and subjects numbers have been combined with the given x data as additional 'columns', while the features are merged as column names. Further, the training data('x_train.txt') and test data('x_test.txt') have been combined to create one data. All these operations are coded in the R-script 'run_analysis.R'. Running the script while being in the same folder as with 'UCI HAR Dataset', will return the text file 'tidydata.txt' in the same folder.

As stated in previous paragraph, for the code to function, the original data must first be downloaded and extracted in same folder where the R-script is saved.
Follwing steps explain the working of the R-script:
Step1: Import all data 
The script imports all the data files provided in the downloaded folder


Step2: Add a "Serial" column to x data and y data(this is done to ensure that the order stays intact while merging)
The raw data isn't labelled with serial no, hence this step is required.


Step3: Assign the x data columns names from the features table
'features.txt' contains the list of features which is to be merged with the main data to make it more readable


Step4: Merge y data to activity labels
'y_train.txt' and 'y_test.txt' contains the list of activity labels as numbers. This is to be merged with 'activity_labels.txt' which contains textual activity correspoding to each label number. Two merged data correspoding to training and test data is obtained


Step5: Merge the x data with the 'merged' y data 
The merged data from previous step is finally merged with main 'X_train.txt'and 'X_test.txt',using serial number as the common column. 


Step6: Rename the columns "V1" and "V2" to more suitable names,and remove "Serial"
"V1" and "V2" are default column names when data is imported and operated in R. They are renamed to names suitably representing the column.


Step7: Rename subject data column and then column bind to respective data
Renaming of columns in 'subject_train.txt' and 'subject_test.txt' is done, which is then added as another column in main data

Step8: Row bind traindata and testdata
The training data and test data is finally merged,by stacking it one over another, or what is called as 'row binding' in R.


Step9: Extract only the column names(i.e.,names(finaldata)) with 'mean()' and 'std()' while keeping the columns for activity.
This is a step towards cleaning the master dataset. mean() and std() are the only requirements for our tidy data, hence are extracted using grep(), a literal search function in R. The search may remove columns for activity and subject, hence they are excluded from grep() search.


Step10: Finally, creating a tidy data subset which has mean summary of all measurement per activity per subject
The resulting table for step9 still has multiple obsrvations per user for each activity. As a final step, they are now averaged into a single observation per user per activity. This is done in following sub-steps
	1.First creating 6 subtables for each activity(using filter())
	2.second,grouping table by SubjectNumber and summarising (using group_by(),excluding activity using select(), and summarize_all() for mean)
	3.finally, row binding all the tables(the subtables created in first step)

The resulting tidy data is written to a text file named 'tidydata.txt'
