## This file is to record the exploratory steps
## Most will be developed into a different, final 
## file

##-------------------------- 

## Load nessessary libaries
library('sqldf')
library('dplyr')
library('data.table')

##--------------------------------- Read Features    ----------------------------------------------

## this gets the names of the 561 features
feature_names <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE)

##----------------------------------- Read Activies --------------------------------------

activity_names <- read.table(file = "UCI HAR Dataset/activity_labels.txt",
                             header = FALSE, 
                             col.names = c("Activity_ID","Activity_Name"))

##-------------------- Read, index, and merge  Test Directory data -------------------------------
##Following calls in raw compents of test directory

## this gets the observations of the features (index will relate (match up exaclty with) to 
## y_test (activity that was done) and subject_test.txt (which person did what acticity))
Test_exploXtest <- read.table(file = "UCI HAR Dataset/test/X_test.txt",
                              header = FALSE,
                              col.names = feature_names$V2)
Test_exploXtest <- mutate(Test_exploXtest, 
                          INDEX_A = seq.int(nrow(Test_exploXtest)))

## y_test (activity that was done)
Test_exploytest <- read.table(file = "UCI HAR Dataset/test/y_test.txt",
                              header = FALSE, col.names = "Activity")
Test_exploytest <- mutate(Test_exploytest,
                          INDEX_B = seq.int(nrow(Test_exploytest)))

Test_exploytest <- sqldf::sqldf("SELECT * 
                                FROM Test_exploytest 
                                INNER JOIN activity_names ON Activity_ID = Activity")

## subject_test.txt (which person did what activity)
Test_exploySubjectTest <- read.table(file = "UCI HAR Dataset/test/subject_test.txt",
                                     header = FALSE,
                                     col.names = "Subject")
Test_exploySubjectTest <- mutate(Test_exploySubjectTest,
                                 INDEX_C = seq.int(nrow(Test_exploytest)))

test_CompleteSet <- sqldf("SELECT * 
                        FROM Test_exploXtest
                        INNER JOIN Test_exploytest 
                        ON Test_exploXtest.[INDEX_A] = Test_exploytest.[INDEX_B]
                        INNER JOIN Test_exploySubjectTest 
                        ON Test_exploXtest.[INDEX_A] = Test_exploySubjectTest.[INDEX_C]")

##-------------------- Read, index, and merge  Train Directory data--------------------------------

##Following calls in raw compents of train directory

## this gets the observations of the features (index will relate (match up exaclty with) to 
## y_test (activity that was done) and subject_test.txt (which person did what acticity))
Train_exploXtrain <- read.table(file = "UCI HAR Dataset/train/X_train.txt",
                                header = FALSE,
                                col.names = feature_names$V2)
Train_exploXtrain <- mutate(Train_exploXtrain,
                            INDEX_A = seq.int(nrow(Train_exploXtrain)))

## y_test (activity that was done)
Train_exploytrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt",
                                header = FALSE,
                                col.names = "Activity")

Train_exploytrain <- mutate(Train_exploytrain, 
                            INDEX_B = seq.int(nrow(Train_exploytrain)))

Train_exploytrain <- sqldf::sqldf("SELECT * 
                                FROM Train_exploytrain 
                                INNER JOIN activity_names ON Activity_ID = Activity")

## subject_test.txt (which person did what activity)
Train_exploySubjectTrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt",
                                       header = FALSE,
                                       col.names = "Subject")

Train_exploySubjectTrain <- mutate(Train_exploySubjectTrain,
                                   INDEX_C = seq.int(nrow(Train_exploySubjectTrain)))

Train_CompleteSet <- sqldf("SELECT *
                          FROM Train_exploXtrain
                          INNER JOIN Train_exploytrain 
                          ON Train_exploXtrain.[INDEX_A] = Train_exploytrain.[INDEX_B]
                          INNER JOIN Train_exploySubjectTrain ON 
                          Train_exploXtrain.[INDEX_A] = Train_exploySubjectTrain.[INDEX_C]")

## ------------------  Merge the test and train data together-----------------------------------

##This will merge the two datasets together

TrainTest_CompleteSet <- sqldf::sqldf("SELECT *
                          FROM Train_CompleteSet
                          UNION
                          SELECT *
                          FROM test_CompleteSet")

##-----------------------Filter to get Subject id, activity std_dev and mean of vars-----------

## Need to get more columns that just in the grep
cols1 <- c("Subject","Activity_Name")

## Get the standard deviaion (std) and mean variables
cols2 <- grep(".std..|.mean",
              names(TrainTest_CompleteSet),
              value = TRUE)

# Bring together for the call
cols <- append(cols1,
               cols2)
#make a call to get a subset that includes Subject ID, desriptive activity, and variables 
filtered_TrainTest_CompleteSet <- TrainTest_CompleteSet[,cols]

##------------------------- OUTPUT the Tidy data set --------------------------

##Group the average of the std and means to subject and activity performed
grouped_TrainTest_CompleteSet <- group_by(filtered_TrainTest_CompleteSet, 
                                          Subject, 
                                          Activity_Name) %>% summarize_all(funs(mean))

##Output the grouped_TrainTest_CompleteSet as a tidy data
#write.csv(grouped_TrainTest_CompleteSet, file = "grouped_TrainTest_CompleteSet.csv")
write.table(grouped_TrainTest_CompleteSet, file = "grouped_TrainTest_CompleteSet.txt", row.name=FALSE)
