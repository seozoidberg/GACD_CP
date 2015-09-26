library(dplyr)

features <- read.table("features.txt")                                                                          # readnig files for colnames
activity_labels <- read.table("activity_labels.txt")                                                              # ...and activities

good_colnames <- c("subject", "activity_id", as.character(features[,2]))                                            # setting colnames
good_colnames <- make.names(names=good_colnames, unique=TRUE, allow_ = TRUE)                                

  test_subject <- read.table("test/subject_test.txt")                                                               # reading subjets, lables and other data for the first data set
  test_labels <- read.table("test/y_test.txt")
  test_set <- read.table("test/X_test.txt")

      united_test <- cbind(test_subject, test_labels, test_set)                                                     # uniting first data

  training_subject <- read.table("train/subject_train.txt")                                                         # reading subjets, lables and other data for the second data set
  training_labels <- read.table("train/y_train.txt")
  training_set <- read.table("train/X_train.txt")

      united_training <- cbind(training_subject, training_labels, training_set)                                     # uniting second data

      united_all <- rbind(united_test, united_training)                                                              # uniting everithing together
      colnames(united_all) <- good_colnames                                                                           # setting colnames (labeling the data set with descriptive variable names)

            united_all <- mutate(united_all, activity = as.character(activity_labels[[2]][activity_id]))            # adding descriptive activity names
            
mean_and_std <- select(united_all, subject, activity, contains(".mean."), contains("std"))                               # extracting only the measurements on the mean and standard deviation for each measurement.

final_data <- mean_and_std %>% group_by(subject, activity) %>% summarise_each(funs(mean))                                # independent tidy data set with the average of each variable for each activity and each subject

write.table(final_data, file = "result.txt", row.names=FALSE)
