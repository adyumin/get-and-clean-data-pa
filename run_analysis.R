# get features labels
features<-read.table("features.txt")
# filter features with names contains "mean()" and "std()"
reqfeat<-grep("mean[(][)]|std[(][)]", features$V2)
# get indexes of that features
featColumnIndex<-features$V1[reqfeat]
# get label of that features
featLabels<-as.character(features$V2[reqfeat])
# get activities labels names of that features
accLabels<-read.table("activity_labels.txt")
# read features file from test set
testsetx<-read.table("./test/X_test.txt")
# read features file from train set
trainsetx<-read.table("./train/X_train.txt")
# merge features sets vertically and get only required columns (mean and std)
combinedsetx<-rbind(trainsetx, testsetx)[,featColumnIndex]
# set meaningful names for columns in dataset 
names(combinedsetx)<-featLabels
# read label file from test set 
testsety<-read.table("./test/Y_test.txt")
# read label file from train set 
trainsety<-read.table("./train/Y_train.txt")
# merge labels sets vertically
combinedsety<-rbind(trainsety, testsety)
# set meaningful names for columns in dataset
names(combinedsety)<-c("Activity")
# read subjects file from test set 
testsets<-read.table("./test/subject_test.txt")
# read subjects file from train set 
trainsets<-read.table("./train/subject_train.txt")
# merge subjects sets vertically
combinedsets<-rbind(trainsets, testsets)
# set meaningful names for columns in dataset
names(combinedsets)<-c("Subject")
# combine datasets horizontally and change in activities numerical codes to test descriptions 
resultset<-cbind(Activity=accLabels[combinedsety$Activity,]$V2, combinedsets, combinedsetx)
# write result to file in CSV format 
write.csv(resultset, "firstset.txt")

# merge features sets vertically (with all columns)
combinedsetx2<-rbind(trainsetx, testsetx)
# set meaningful names for columns in dataset 
names(combinedsetx2)<-as.character(features$V2)
# combine datasets (labels, subjects, features) horizontally and change in activities numerical codes to test descriptions 
tempset<-cbind(Activity=accLabels[combinedsety$Activity,]$V2, combinedsets, combinedsetx2)
# create new frame with average values of features aggregated by activity and subject
resultset2<-aggregate(tempset[,3:dim(tempset)[2]], by=list(Activity=resultset$Activity, Subject=resultset$Subject), FUN=mean)
# write result to file in CSV format 
write.csv(resultset2, "secondset.txt")
