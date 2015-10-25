#Setting Work Directory

setwd("./Getting and Cleaning Data/UCI HAR Dataset")
library(reshape2)
#load Datasets

Train_x<-read.table("./train/X_train.txt")
Train_y<-read.table("./train/y_train.txt")
Train_sub<-read.table("./train/subject_train.txt")

Test_x<-read.table("./test/X_test.txt")
Test_y<-read.table("./test/y_test.txt")
Test_sub<-read.table("./test/subject_test.txt")

# Load the labels 
Labs<-read.table("./activity_labels.txt")
# Load the features 
feat<-read.table("./features.txt")

#Merge the Datasets into one Dataset

Total_x<-rbind(Test_x,Train_x)
Total_y<-rbind(Test_y,Train_y)
Total_sub<-rbind(Test_sub,Train_sub)

#Appropriately labels the data set with descriptive variable names. 
names(Total_x)<-feat$V2
names(Total_y)<-"Activity"
names(Total_sub)<-"subject"

Dat<-cbind(Total_sub,Total_y,Total_x)

#Extract means and stdev of each measurement
means<-Dat[,grepl("mean",names(Dat))]
stdevs<-Dat[,grepl("std",names(Dat))]

#Uses descriptive activity names to name the activities in the data set
Dat$Activity<-Labs$V2[Dat$Activity]

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
MeltDat<-melt(Dat,id=c("subject","Activity"))
final<-dcast(MeltDat,subject + Activity ~ variable, mean)
#write the tidy data to a .txt file
write.table(final,"final.txt",row.names=FALSE)