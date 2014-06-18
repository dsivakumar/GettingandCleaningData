##also reads the file X_train.txt in table fomat and creates a data frame named X_Train and X_test
##also reads the file y_train.txt in table fomat and creates a data frame named Y_Train and Y_test

X_train <-  read.table("./train/X_train.txt")
Y_train <-  read.table("./train/Y_train.txt")
X_test <-  read.table("./test/X_test.txt")
Y_test <-  read.table("./test/y_test.txt")
##Reads the file subject_train.txt in table format to create a data frame sub_train and sub_test

sub_train <-  read.table("./train/subject_train.txt")
sub_test <-  read.table("./test/subject_test.txt")
sub <- rbind(sub_train, sub_test)

##read activity labels
activityLabels <- read.table("./activity_labels.txt")

##Reads the file features.txt in table format and creates a data frame named features
features <-  read.table("./features.txt")
#grep only mean and std coloumns
cols<-grep("mean|std", features[,2],ignore.case=T)

#bind all together
X <- rbind(X_train, X_test)
X<-X[,cols]
colnames(X)<-features[cols,2]


Y <- rbind(Y_train, Y_test)

XY<-cbind(Y,sub,X)
##add column names
colnames(XY)[1:2]<-c("Activity","Subject")

#create tidy data using aggregate
tidy_data<-aggregate(XY[,3:88], by=list(XY$Activity,XY$Subject), FUN=mean)

colnames(tidy_data)[1:2]<-c("Activity","Subject")
#give column names
tidy_data$Activity <- factor(tidy_data$Activity, levels=activityLabels $V1, labels=activityLabels$V2)

#write the results
write.table(file="./tidy_data.txt",x=tidy_data)
