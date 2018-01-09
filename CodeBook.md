Introduction:

This project's intention is to aquire and agreggate information that was gathered to produce the 
following pulication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The files associated with this project processes files generated during the original work [see item above [1]. Due to resource limitations the original files are not available in this repositoryu. Hoever, the original files are explained at and can be downloaded from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones




From here this code book will be broken into tow parts:

CODE BOOK FOR THIS PROJECT - This portion of the document will describe the processes and objects of the script 'run_analysis.R'.

ORIGINAL WORK TO PRODUCE PULICATION README - This was added to clarifiy sources of data to create various objects. 




CODE BOOK FOR THIS PROJECT


In brief the script combines data from data sets identied as test and train. The parameters are the same in both data sets. Basically the data are recorded or calculated from or data extracted from 30 different subjects doing six different activities.  


The variables themselves are best describes as follows:

Test - Any variable that begins with the word test is derived from text files associated with the test data set. The origin test files are: 'features.txt','activity_labels.txt','test/X_test.txt','test/y_test.txt'

Train - Any variable that begins with the word train is derived from text files associated with the train data set. The origin test files are: 'features.txt','activity_labels.txt','train/X_train.txt','train/y_train.txt'

TrainTest - Any variable that begins with both train and test are both train and test datasets merged together. 


The majority of the variables are either for extraction of the data or operations on it. The important exceptions are:

test_CompleteSet - The completed set of test data after processing to include externtal relationships.

Train_completeSet - The completed set of train data after processing to include externtal relationships.

TrainTest_CompleteSet - The resulting data set from merging test_CompleteSet and Train_completeSet.

filtered_TrainTest_CompleteSet - This variable is filtered to exclude any parameter that doesnt include the standard deviation or average calculated parameter. 

grouped_TrainTest_CompleteSet - This variable takes 'filtered_TrainTest_CompleteSet' groups the subjects and activity together and aggregates the parameter by getting the mean.




ORIGINAL WORK TO PRODUCE PULICATION README

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.