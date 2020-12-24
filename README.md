# GettingData_projectFinal
Final project of Getting and Cleaning data course

All explanations are also written as comments in the main R (run_analysis.R) file. Please read all comments in that file to understand what I did.

codebook
train: train data set from train/X_train.txt file \n
test: test data set from test/X_test.txt file\n
trainl: column labels for the train dataset obtained from train/y_train.txt file\n
testl: column labels for the test dataset obtained from test/y_test.txt file\n
activity: activities labels used during the experiment and will be used in the tidy dataset (improving readability)\n
test_subject: ID of subjects that participated in the test experiment\n
train_subject: ID of subjects that participated in the train experiment\n
dataset: total daset obtained form binding the rows from test and train datasets (only columns with mean and standard deviation)\n
labels:labels of the dataset variable\n
mean_dataset: dataset obtained from dataset variable after grouping by activity and subjects averages.\n
