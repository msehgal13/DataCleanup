##load the libraries
library(dplyr)
library(tibble)
library(tidyr)

##Set the directory
dir<-"/Users/manavsehgal/Library/Mobile Documents/com~apple~CloudDocs/Work/Study/Coursera/Data-Scientist/datasciencecoursera/DataCleanup/UCI HAR Dataset"

##Read the activity and features dataset
activity_label<-read.table(paste0(dir,"/activity_labels.txt"),header = FALSE,col.names = c("activity_flag","activity"))
features<-read.table(paste0(dir,"/features.txt"),header = FALSE)

#create a list of variable names
names_list<-features$V2

##Read all the required files into the respective datasets and variable names
x_test<-read.table(paste0(dir,"/test/X_test.txt"),header = FALSE,col.names = names_list)
y_test<-read.table(paste0(dir,"/test/Y_test.txt"),header = FALSE)
subject_test<-read.table(paste0(dir,"/test/subject_test.txt"),header = FALSE)

x_train<-read.table(paste0(dir,"/train/X_train.txt"),header = FALSE,col.names = names_list)
y_train<-read.table(paste0(dir,"/train/Y_train.txt"),header = FALSE)
subject_train<-read.table(paste0(dir,"/train/subject_train.txt"),header = FALSE)


##Combine the test datasets into one
test_combined<-mutate(x_test,activity_flag=y_test$V1,subject=subject_test$V1)
##Merge the test database with activity labels
test_final<-merge(test_combined,activity_label,by.x="activity_flag",by.y="activity_flag",all=TRUE)
##print the head of the final test database
#print(head(test_final,n=2))

##Combine the train datasets into one
train_combined<-mutate(x_train,activity_flag=y_train$V1,subject=subject_train$V1)
##Merge the train database with activity labels
train_final<-merge(train_combined,activity_label,by.x="activity_flag",by.y="activity_flag",all=TRUE)

##print the head of the final test database
#print(head(train_final,n=2))

##Merge the train and test dataset into one
final_data<-rbind(test_final,train_final)

##print the head and tail of the final database
#print(head(final_data,n=2))
#print(tail(final_data,n=2))

#Select only those variables that contain the mean or the std
final_data2<-select(final_data,subject,activity,contains("mean."),contains("std."))

##group by the final database with activity and subject
final_data2<-group_by(final_data2,subject,activity)

##create another summary table with means of each variable
final_summary<-summarize_all(final_data2,funs(mean))

##write the file to a txt file
write.table(final_summary,file = "final_summar.txt",row.names = FALSE,quote=FALSE)

