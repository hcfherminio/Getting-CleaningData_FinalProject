#Final project Getting and Cleanin Data course

library(dplyr)#we are going to use it

#reading files that I will use
train<-read.table("train/X_train.txt", sep="",header=FALSE)#dataset
test<-read.table("test/X_test.txt",sep="",header=FALSE)#dataset
trainl<-read.table("train/y_train.txt", sep="",header=FALSE)#dataset label
testl<-read.table("test/y_test.txt",sep="",header=FALSE)#dataset label
activity<-read.table("activity_labels.txt")[,-1]

#binding both datasets rows
dataset<-rbind(train,test)
#binding both dataset labels
labels<-rbind(trainl,testl)

#getting column names properly
cols<-read.table("features.txt",header=FALSE)[,-1]
colnames(dataset)<-cols
colnames(labels)<-"Labels"

#getting labels names instead of numbers
for(i in c(1:6)){
      labels$Labels<-gsub(i,activity[i],labels$Labels)}

#getting the dataset required by the assigment (only means and standard deviations)
#finding columns with means
dataset<-dataset[,sort(c(grep("*mean*",colnames(dataset)),
                         grep("*std*",colnames(dataset))))]

#binding dataset with activity labels
dataset<-cbind(dataset,labels)

#getting a second data frame with the average as asked in the assigment
#using dplyr
mean_dataset<-dataset %>%
             group_by(Labels) %>%
             summarise_all(list(~mean(.,na.rm=TRUE)))

#writing the output file as asked
write.table(mean_dataset,"mean_dataset.txt",row.name=FALSE,sep=" ")



