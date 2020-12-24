# GettingData_projectFinal
Final project of Getting and Cleaning data course

All explanations are also written as comments in the main R (run_analysis.R) file. Please read all comments in that file to understand what I did.

CODEBOOK:
train: train data set from train/X_train.txt file 
test: test data set from test/X_test.txt file
trainl: column labels for the train dataset obtained from train/y_train.txt file
testl: column labels for the test dataset obtained from test/y_test.txt file 
activity: activities labels used during the experiment and will be used in the tidy dataset (improving readability)
test_subject: ID of subjects that participated in the test experiment
train_subject: ID of subjects that participated in the train experiment
dataset: total daset obtained form binding the rows from test and train datasets (only columns with mean and standard deviation)
labels:labels of the dataset variable
mean_dataset: dataset obtained from dataset variable after grouping by activity and subjects averages.
