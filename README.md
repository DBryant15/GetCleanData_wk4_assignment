This project's intention is to aquire and agreggate information that was gathered to produce the 
following pulication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

The files associated with this project processes files generated during the original work [see item above [1]. Due to resource limitations the original files are not available in this repositoryu. Hoever, the original files are explained at and can be downloaded from:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



Files covered by this README:

CodeBook.md - Code book associated with this project and will describe the relationship between this project and the work associated with the original publication. 

run_analysis.R - R script that progresses through steps that create a tidy data set. For details of this scripts functioning look to the script itself or for an overview look to the CodeBook.md file. 

grouped_TrainTest_CompleteSet.csv - Comma separated txt file that contains a tidy data set. This file provides the mean for 79 parameters from the original test and train data sets. The parameters are referenced to each of the 30 individual subjects doing six different activities. The parameters themselves are averages of any of the original parameters that contained the standard deviation or mean. For details on the parameters please refence to the oringial dataset.