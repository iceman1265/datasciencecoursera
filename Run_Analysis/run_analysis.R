if(file.exists("./data")) {
        setwd("./data")
} else {
        dir.create("./data")
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, destfile="./data/projectfile.zip", method="curl")
        setwd("./data")
        unzip("projectfile.zip", files=NULL, list=FALSE, overwrite=TRUE,
              junkpaths=FALSE,exdir=".",unzip="internal",setTimes=FALSE)
}

library(plyr)

subject_train <-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

subject_measures <- rbind(subject_train,subject_test)
activity_measures <- rbind(y_train,y_test)
reading_measures <- rbind(x_train,x_test)

list(x=reading_measures, y=activity_measures, subject=subject_measures)


meanandstdextraction = function(df) {
        features <- read.table("data/UCI HAR Dataset/features.txt")
        column_mean <- sapply(features[,2], function(x) grep1("mean()", x, fixed=T))
        column_std <- sapply(features[,2], function(x) grep1("std()",x,fixed=T))
        
        data <- df[, (column_mean | column_std)]
        colnames(data) <- features[(column_mean | column_std), 2]
        data
}


activity_names = function(df) {
        colnames(df) <- "Activity_Data"
        df$activity[df$activity == 1] = "Walking_Data"
        df$activity[df$activity == 2] = "Walking_Upstairs_Data"
        df$activity[df$activity == 3] = "Walking_Downstairs_Data"
        df$activity[df$activity == 4] = "Sitting_Data"
        df$activity[df$activity == 5] = "Standing_Data"
        df$activity[df$activity == 6] = "LayingDown_Data"
        df
}

bind_data <- function(x,y,subjects){
        cbind(x,y,subjects)
}

tidy_data = function(df) {
        tidy <- ddply(df, .(subject, activity), function(x) column_mean(x[,1:60]))
        tidy
}

final_data = function(){
        download.data()
        merged <- merge.datasets()
        real_x <- meanandstdextraction(merged$x)
        real_y <- activity_names(merged$y)
        colnames(merged$subject) <- c("subject")
        combined <- bind_data(real_x,real_y,merged$subject)
        tidy <- tidy_data(combined)
        write.csv(tidy, "UCI_Coursera_Tidy_Data.csv",row.names=FALSE)
}