#Code Book
This code book will describe the variables, the data, and any transformations of work that used to clean up the data.


##Overview
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


##The dataset includes the following files:

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

* 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* 'subject_test.txt': A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.


##Transformations:

* Merges the training and the test sets to create one data set.

* Extracts only the measurements on the mean and standard deviation for each measurement.

* Uses descriptive activity names to name the activities in the data set.

* Appropriately labels the data set with descriptive variable names.

* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.