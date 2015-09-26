# How the script works

1. It takes training data form "train" folder and test data for "test" folder.
2. Unites the together.
3. Labels the variables from "features.txt" and activities from "activity_labels.txt".
4. Extracts only variables containing measurements on the mean and standard deviation.
5. Create new data set, containing average of each variable, grouped by subject and activity.