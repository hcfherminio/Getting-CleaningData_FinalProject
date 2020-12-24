#Final project Getting and Cleaning Data course

library(dplyr)#we are going to use it

#reading files that I will use
train<-read.table("train/X_train.txt", sep="",header=FALSE)#train dataset
test<-read.table("test/X_test.txt",sep="",header=FALSE)#test dataset
trainl<-read.table("train/y_train.txt", sep="",header=FALSE)#dataset label
testl<-read.table("test/y_test.txt",sep="",header=FALSE)#dataset label
activity<-read.table("activity_labels.txt")[,-1]#activity labels
test_subject<-read.table("test/subject_test.txt", sep="",header=FALSE)#subjects used
train_subject<-read.table("train/subject_train.txt", sep="",header=FALSE)#subjects used

#binding subjects to the dataset
train<-cbind(train,train_subject)
test<-cbind(test,test_subject) 

#binding both datasets rows
dataset<-rbind(train,test)
#binding both dataset labels
labels<-rbind(trainl,testl)

#getting column names properly
cols<-read.table("features.txt",header=FALSE)[,-1]
colnames(dataset)<-c(cols,"Subject_ID")
colnames(labels)<-"Activities"

#getting labels names instead of numbers
for(i in c(1:6)){
      labels$Activities<-gsub(i,activity[i],labels$Activities)}

#getting the dataset required by the assigment (only means and standard deviations)
#finding columns with means 
dataset<-dataset[,sort(c(grep("*mean*",colnames(dataset)),
                         grep("*std*",colnames(dataset)),
                         grep("Subject_ID",colnames(dataset))))]

#binding dataset with activity labels
dataset<-cbind(dataset,labels)

#getting a second data frame with the average as asked in the assigment
#using dplyr
mean_dataset<-dataset %>%
             group_by(Subject_ID,Activities) %>%
             summarise_all(list(~mean(.,na.rm=TRUE)))

#writing the output file as asked
write.table(mean_dataset,"mean_dataset.txt",row.name=FALSE,sep=" ")



