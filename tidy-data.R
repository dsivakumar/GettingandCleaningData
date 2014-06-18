X_train <-  read.table("./train/X_train.txt")
Y_train <-  read.table("./train/Y_train.txt")
X_test <-  read.table("./test/X_test.txt")
Y_test <-  read.table("./test/y_test.txt")

sub_train <-  read.table("./train/subject_train.txt")
sub_test <-  read.table("./test/subject_test.txt")
sub <- rbind(sub_train, sub_test)

activityLabels <- read.table("./activity_labels.txt")

features <-  read.table("./features.txt")
cols<-grep("mean|std", features[,2],ignore.case=T)


X <- rbind(X_train, X_test)
X<-X[,cols]
colnames(X)<-features[cols,2]


Y <- rbind(Y_train, Y_test)

XY<-cbind(Y,sub,X)

colnames(XY)[1:2]<-c("Activity","Subject")


tidy_data<-aggregate(XY[,3:88], by=list(XY$Activity,XY$Subject), FUN=mean)

colnames(tidy_data)[1:2]<-c("Activity","Subject")

tidy_data$Activity <- factor(tidy_data$Activity, levels=activityLabels $V1, labels=activityLabels$V2)

write.table(file="./tidy_data.txt",x=tidy_data)
