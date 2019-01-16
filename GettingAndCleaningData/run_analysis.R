#Before beginning, ensure that the folder 'UCI HAR Dataset' and the following code are at same level in directory
#Step1: Import all data
subjecttest<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE,colClasses = "numeric")
subjecttrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE,colClasses = "numeric")
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE,colClasses = "numeric")
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE,colClasses = "numeric")
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE,colClasses = "numeric")
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE,colClasses = "numeric")
activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE,colClasses = "character")

#Step2: Add a "Serial" column to x data and y data(this is done to ensure that the order stays intact while merging)
xtest<-mutate(xtest,Serial=1:n())# mutate will add the column at the END of the table
xtrain<-mutate(xtrain,Serial=1:n())
ytest<-mutate(ytest,Serial=1:n())
ytrain<-mutate(ytrain,Serial=1:n())

#Step3: Assign the x data columns names from the features table
names(xtest)[1:561]<-features$V2 #notice that last column 'serial' added by mutate is excluded
names(xtrain)[1:561]<-features$V2

#Step4: Merge y data to activity labels 
mymergetest<-merge(ytest,activitylabels,by.x = "V1",by.y = "V1")
mymergetrain<-merge(ytrain,activitylabels,by.x = "V1",by.y = "V1")

#Step5: Merge the x data with the 'merged' y data 
testdata<-merge(mymergetest,xtest,by.x = "Serial",by.y = "Serial")
traindata<-merge(mymergetrain,xtrain,by.x = "Serial",by.y = "Serial")

#Step6: Rename the columns "V1" and "V2" to more suitable names,and remove "Serial"
testdata<-rename(testdata,ActivityLabels=V1,Activity=V2)
testdata<-select(testdata,-Serial)
traindata<-rename(traindata,ActivityLabels=V1,Activity=V2)
traindata<-select(traindata,-Serial)

#Step7: Rename subject data column and then column bind to respective data
subjecttest<-rename(subjecttest,SubjectNumber=V1)
subjecttrain<-rename(subjecttrain,SubjectNumber=V1)
testdata<-cbind(subjecttest,testdata)
traindata<-cbind(subjecttrain,traindata)

#Step8: Row bind traindata and testdata
finaldata<-rbind(traindata,testdata)

#Step9: Extract only the column names(i.e.,names(finaldata)) with 'mean()' and 'std()' while keeping the columns for activity
mynewtable<-cbind(finaldata[,1:3],finaldata[,grep("*mean\\(\\)*|*std\\(\\)*",names(finaldata))])

#Step10: Finally, creating a tidy data subset which has mean summary of all measurement per activity per subject
#First creating 6 subtables for each activity
filtertable1<-filter(mynewtable,Activity=="WALKING")
filtertable2<-filter(mynewtable,Activity=="WALKING_UPSTAIRS")
filtertable3<-filter(mynewtable,Activity=="WALKING_DOWNSTAIRS")
filtertable4<-filter(mynewtable,Activity=="SITTING")
filtertable5<-filter(mynewtable,Activity=="STANDING")
filtertable6<-filter(mynewtable,Activity=="LAYING")

#second,grouping table by SubjectNumber and summarising
Temptable1<-filtertable1%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable1<-cbind(Activity="WALKING",Temptable1)
Temptable2<-filtertable2%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable2<-cbind(Activity="WALKING_UPSTAIRS",Temptable2)
Temptable3<-filtertable3%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable3<-cbind(Activity="WALKING_DOWNSTAIRS",Temptable3)
Temptable4<-filtertable4%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable4<-cbind(Activity="SITTING",Temptable4)
Temptable5<-filtertable5%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable5<-cbind(Activity="STANDING",Temptable5)
Temptable6<-filtertable6%>%group_by(SubjectNumber)%>%select(-(ActivityLabels:Activity))%>%summarize_all(mean)
Temptable6<-cbind(Activity="LAYING",Temptable6)

#finally, row binding all the tables
tidydatafinal<-rbind(Temptable1,Temptable2,Temptable3,Temptable4,Temptable5,Temptable6)
names(tidydatafinal)[3:68]<-paste0("MEANOF_",names(tidydatafinal)[3:68])
View(tidydatafinal)

#writing the same table to directory. Commented here.
# write.table(tidydatafinal,"TidyData.txt",sep=" ",row.names = FALSE)
