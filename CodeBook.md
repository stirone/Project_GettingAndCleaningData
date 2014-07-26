CodeBook for Getting and Cleaning Data Project
========================================================

The output file `run_analysis_output.txt` is a tab-delimited text file which contains the mean of the following variables for each activity and each subject.  As there are 6 activities and 30 subjects, there are 180 rows in the output file.  The output is sorted by subject (numerically) and activity (alphabetically) per subject.  The columns are as follows:

1. subject = the subject performing the activity (1:6)
2. activity = the activity being performed at the time the measurement was made. Valid values are
  * `LAYING`
  * `SITTING`
  * `STANDING`
  * `WALKING`
  * `WALKING_DOWNSTAIRS`
  * `WALKING_UPSTAIRS`

3. `mean_of_tBodyAcc-mean()-X` = mean of `tBodyAcc-mean()-X`                    
4. `mean_of_tBodyAcc-mean()-Y` = mean of `tBodyAcc-mean()-Y`                    
5. `mean_of_tBodyAcc-mean()-Z` = mean of `tBodyAcc-mean()-Z`                    
6. `mean_of_tBodyAcc-std()-X` = mean of `tBodyAcc-std()-X`                      
7. `mean_of_tBodyAcc-std()-Y` = mean of `tBodyAcc-std()-Y`                      
8. `mean_of_tBodyAcc-std()-Z` = mean of `tBodyAcc-std()-Z`                      
9. `mean_of_tGravityAcc-mean()-X` = mean of `tGravityAcc-mean()-X`              
10. `mean_of_tGravityAcc-mean()-Y` = mean of `tGravityAcc-mean()-Y`              
11. `mean_of_tGravityAcc-mean()-Z` = mean of `tGravityAcc-mean()-Z`              
12. `mean_of_tGravityAcc-std()-X` = mean of `tGravityAcc-std()-X`                
13. `mean_of_tGravityAcc-std()-Y` = mean of `tGravityAcc-std()-Y`                
14. `mean_of_tGravityAcc-std()-Z` = mean of `tGravityAcc-std()-Z`                
15. `mean_of_tBodyAccJerk-mean()-X` = mean of `tBodyAccJerk-mean()-X`            
16. `mean_of_tBodyAccJerk-mean()-Y` = mean of `tBodyAccJerk-mean()-Y`            
17. `mean_of_tBodyAccJerk-mean()-Z` = mean of `tBodyAccJerk-mean()-Z`            
18. `mean_of_tBodyAccJerk-std()-X` = mean of `tBodyAccJerk-std()-X`              
19. `mean_of_tBodyAccJerk-std()-Y` = mean of `tBodyAccJerk-std()-Y`              
20. `mean_of_tBodyAccJerk-std()-Z` = mean of `tBodyAccJerk-std()-Z`              
21. `mean_of_tBodyGyro-mean()-X` = mean of `tBodyGyro-mean()-X`                  
22. `mean_of_tBodyGyro-mean()-Y` = mean of `tBodyGyro-mean()-Y`                  
23. `mean_of_tBodyGyro-mean()-Z` = mean of `tBodyGyro-mean()-Z`                  
24. `mean_of_tBodyGyro-std()-X` = mean of `tBodyGyro-std()-X`                    
25. `mean_of_tBodyGyro-std()-Y` = mean of `tBodyGyro-std()-Y`                    
26. `mean_of_tBodyGyro-std()-Z` = mean of `tBodyGyro-std()-Z`                    
27. `mean_of_tBodyGyroJerk-mean()-X` = mean of `tBodyGyroJerk-mean()-X`          
28. `mean_of_tBodyGyroJerk-mean()-Y` = mean of `tBodyGyroJerk-mean()-Y`          
29. `mean_of_tBodyGyroJerk-mean()-Z` = mean of `tBodyGyroJerk-mean()-Z`          
30. `mean_of_tBodyGyroJerk-std()-X` = mean of `tBodyGyroJerk-std()-X`            
31. `mean_of_tBodyGyroJerk-std()-Y` = mean of `tBodyGyroJerk-std()-Y`            
32. `mean_of_tBodyGyroJerk-std()-Z` = mean of `tBodyGyroJerk-std()-Z`            
33. `mean_of_tBodyAccMag-mean()` = mean of `tBodyAccMag-mean()`                  
34. `mean_of_tBodyAccMag-std()` = mean of `tBodyAccMag-std()`                    
35. `mean_of_tGravityAccMag-mean()` = mean of `tGravityAccMag-mean()`            
36. `mean_of_tGravityAccMag-std()` = mean of `tGravityAccMag-std()`              
37. `mean_of_tBodyAccJerkMag-mean()` = mean of `tBodyAccJerkMag-mean()`          
38. `mean_of_tBodyAccJerkMag-std()` = mean of `tBodyAccJerkMag-std()`            
39. `mean_of_tBodyGyroMag-mean()` = mean of `tBodyGyroMag-mean()`                
40. `mean_of_tBodyGyroMag-std()` = mean of `tBodyGyroMag-std()`                  
41. `mean_of_tBodyGyroJerkMag-mean()` = mean of `tBodyGyroJerkMag-mean()`        
42. `mean_of_tBodyGyroJerkMag-std()` = mean of `tBodyGyroJerkMag-std()`          
43. `mean_of_fBodyAcc-mean()-X` = mean of `fBodyAcc-mean()-X`                    
44. `mean_of_fBodyAcc-mean()-Y` = mean of `fBodyAcc-mean()-Y`                    
45. `mean_of_fBodyAcc-mean()-Z` = mean of `fBodyAcc-mean()-Z`                    
46. `mean_of_fBodyAcc-std()-X` = mean of `fBodyAcc-std()-X`                      
47. `mean_of_fBodyAcc-std()-Y` = mean of `fBodyAcc-std()-Y`                      
48. `mean_of_fBodyAcc-std()-Z` = mean of `fBodyAcc-std()-Z`                      
49. `mean_of_fBodyAccJerk-mean()-X` = mean of `fBodyAccJerk-mean()-X`            
50. `mean_of_fBodyAccJerk-mean()-Y` = mean of `fBodyAccJerk-mean()-Y`            
51. `mean_of_fBodyAccJerk-mean()-Z` = mean of `fBodyAccJerk-mean()-Z`            
52. `mean_of_fBodyAccJerk-std()-X` = mean of `fBodyAccJerk-std()-X`              
53. `mean_of_fBodyAccJerk-std()-Y` = mean of `fBodyAccJerk-std()-Y`              
54. `mean_of_fBodyAccJerk-std()-Z` = mean of `fBodyAccJerk-std()-Z`              
55. `mean_of_fBodyGyro-mean()-X` = mean of `fBodyGyro-mean()-X`                  
56. `mean_of_fBodyGyro-mean()-Y` = mean of `fBodyGyro-mean()-Y`                  
57. `mean_of_fBodyGyro-mean()-Z` = mean of `fBodyGyro-mean()-Z`                  
58. `mean_of_fBodyGyro-std()-X` = mean of `fBodyGyro-std()-X`                    
59. `mean_of_fBodyGyro-std()-Y` = mean of `fBodyGyro-std()-Y`                    
60. `mean_of_fBodyGyro-std()-Z` = mean of `fBodyGyro-std()-Z`                    
61. `mean_of_fBodyAccMag-mean()` = mean of `fBodyAccMag-mean()`                  
62. `mean_of_fBodyAccMag-std()` = mean of `fBodyAccMag-std()`                    
63. `mean_of_fBodyBodyAccJerkMag-mean()` = mean of `fBodyBodyAccJerkMag-mean()`  
64. `mean_of_fBodyBodyAccJerkMag-std()` = mean of `fBodyBodyAccJerkMag-std()`    
65. `mean_of_fBodyBodyGyroMag-mean()` = mean of `fBodyBodyGyroMag-mean()`        
66. `mean_of_fBodyBodyGyroMag-std()` = mean of `fBodyBodyGyroMag-std()`          
67. `mean_of_fBodyBodyGyroJerkMag-mean()` = mean of `fBodyBodyGyroJerkMag-mean()`
68. `mean_of_fBodyBodyGyroJerkMag-std()` = mean of fBodyBodyGyroJerkMag-std()`  



