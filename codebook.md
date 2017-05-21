# Cleaning the data set

The script provide performs several operations on the data set fetched from the following link and makes it ready as per the 
requirement for furthur analysis.   
A tidy data set the result of running the script.  
The tidy data set is provided in a file called tidy_data.txt  
We can read the tidy data set with the following command  
`data <- read.table("tidy_data.txt")`

The data set was downloaded from the following URL  
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Changes made to the original data set in order to produce the tidy data set

* Merge the training and the test sets to create one data set.
* Extract only the measurements on the mean and standard deviation for each measurement
* Give discriptive names to the activity
* Appropriately label the data set with descriptive variable names.
* Create a new tidy data set

## Description of changes made

* Read the X_train, subject and y_lable and bind these columns together to form a single data set. 
  Do this for both train and test data sets. Using `cbind`
* Bind the train and test data sets created above by `rbind`
* Extract the features list from _features.txt_ and search for features with strings 'std | mean' and extract those features
* Replace the factor variables for activity
* Appropriately renaming the variables the following main renaming measures have been taken.  
```
final_names <- gsub("\\(\\)", "", final_names)
final_names <- gsub("Acc", "acceleration", final_names)
final_names <- gsub("Mag", "magnitude", final_names)
final_names <- gsub("^t(.*)$", "\\1_time", final_names)
final_names <- gsub("^f(.*)$", "\\1_frequency", final_names)

final_names <- gsub("BodyBody", "Body", final_names)
```
* Finally create a new data set 

## Description of tidy_data.txt

* no rows 11880
* no columns 4

### Columns
* Activity - Factor variable with 6 different levels like _'WALKING', 'WALKING_UPSTAIRS', 'WALKING_DOWNSTAIRS', 'SITTING', 'STANDING' and 'LAYING'_
* Subject - is also a factor variable with 30 levels
* Value - is the mean value for a particular variable
* Variable - name of the variable for which we found out means

##### Additional description for 'Variable'
It has following variables  
* "body_acceleration_mean_x_time"                 
* "body_acceleration_mean_y_time"                 
* "body_acceleration_mean_z_time"                 
* "body_acceleration_std_x_time"                  
* "body_acceleration_std_y_time"                  
* "body_acceleration_std_z_time"                  
* "gravity_acceleration_mean_x_time"              
* "gravity_acceleration_mean_y_time"              
* "gravity_acceleration_mean_z_time"              
* "gravity_acceleration_std_x_time"               
* "gravity_acceleration_std_y_time"               
* "gravity_acceleration_std_z_time"               
* "body_acceleration_jerk_mean_x_time"            
* "body_acceleration_jerk_mean_y_time"            
* "body_acceleration_jerk_mean_z_time"            
* "body_acceleration_jerk_std_x_time"             
* "body_acceleration_jerk_std_y_time"             
* "body_acceleration_jerk_std_z_time"             
* "body_gyro_mean_x_time"                         
* "body_gyro_mean_y_time"                         
* "body_gyro_mean_z_time"                         
* "body_gyro_std_x_time"                          
* "body_gyro_std_y_time"                          
* "body_gyro_std_z_time"                          
* "body_gyro_jerk_mean_x_time"                    
* "body_gyro_jerk_mean_y_time"                    
* "body_gyro_jerk_mean_z_time"                    
* "body_gyro_jerk_std_x_time"                     
* "body_gyro_jerk_std_y_time"                     
* "body_gyro_jerk_std_z_time"                     
* "body_accelerationmagnitude_mean_time"          
* "body_accelerationmagnitude_std_time"           
* "gravity_accelerationmagnitude_mean_time"       
* "gravity_accelerationmagnitude_std_time"        
* "body_acceleration_jerkmagnitude_mean_time"     
* "body_acceleration_jerkmagnitude_std_time"      
* "body_gyromagnitude_mean_time"                  
* "body_gyromagnitude_std_time"                   
* "body_gyro_jerkmagnitude_mean_time"             
* "body_gyro_jerkmagnitude_std_time"              
* "body_acceleration_mean_x_frequency"            
* "body_acceleration_mean_y_frequency"            
* "body_acceleration_mean_z_frequency"            
* "body_acceleration_std_x_frequency"             
* "body_acceleration_std_y_frequency"             
* "body_acceleration_std_z_frequency"             
* "body_acceleration_jerk_mean_x_frequency"       
* "body_acceleration_jerk_mean_y_frequency"       
* "body_acceleration_jerk_mean_z_frequency"       
* "body_acceleration_jerk_std_x_frequency"        
* "body_acceleration_jerk_std_y_frequency"        
* "body_acceleration_jerk_std_z_frequency"        
* "body_gyro_mean_x_frequency"                    
* "body_gyro_mean_y_frequency"                    
* "body_gyro_mean_z_frequency"                    
* "body_gyro_std_x_frequency"                     
* "body_gyro_std_y_frequency"                     
* "body_gyro_std_z_frequency"                     
* "body_accelerationmagnitude_mean_frequency"     
* "body_accelerationmagnitude_std_frequency"      
* "body_acceleration_jerkmagnitude_mean_frequency
* "body_acceleration_jerkmagnitude_std_frequency" 
* "body_gyromagnitude_mean_frequency"             
* "body_gyromagnitude_std_frequency"              
* "body_gyro_jerkmagnitude_mean_frequency"        
* "body_gyro_jerkmagnitude_std_frequency"         













