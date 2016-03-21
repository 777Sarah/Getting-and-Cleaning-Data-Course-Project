Codebook
========


Basic Flow
-----------
In run_analysis.R, the basic flow is:

* Getting the data and save it to working directory, unzip the files.
* Merge the training and the test data sets to create one data set. 
  * Read the test data sets from raw data files.
  * Read the train data sets from raw data files.
  * Read the features and activity data sets.
  * Merge the train and the test data in one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variable list and descriptions
------------------------------

Variable name    | Description
-----------------|------------
XTest            | X_test data
YTest            | Y_test data
SubjectTest      | subject_test data
XTrain           | X_train data
YTrain           | Y_train data
SubjectTrain     | subject_train data
features         | features data
activity         | activity_labels data
X                | merged dataset by XTest and XTrain data
Y                | merged dataset by YTest and YTrain data
Subject          | merged dataset by SubjectTest and SubjectTrain data
dim_X            | dimension of X data set
dim_Y            | dimension of Y data set
dim_Subject      | dimension of Subject data set
index            | features indeces which contain mean() and std() in their name
CountFeatures    | count of features
subsetX          | getting the variables with mean/stdev
dim_subsetX      | dimension of subsetX 
Y                | the replacing numeric values with lookup value from adtivity.txt, which won't reorder Y set
headY            | first 6 rows for the new Y set
names            | getting names for variables
names(subsetX)   | updating colNames for new data set
name(Subject)    | change the colName to "SubjectID"
name(Y)          | change the colName to "Activity"
CleanedData      | merged dataset by Subject, Y and X
headCleanedData  | the first 4 columns for CleanedData data set
CleanedData2     | fast subset the CleanedData data set
TidyData         | features average by Subject and by Activity
dimTidyData      | dimension of TidyData data set
headTidyData     | first 10 rows and 4 columns in Tidy data set


Dataset structure
-----------------


```r
str(Tidydata)
```

```
Classes ‘data.table’ and 'data.frame':	180 obs. of  68 variables:
 $ SubjectID                  : int  2 2 2 2 2 2 4 4 4 4 ...
 $ Activity                   : Factor w/ 6 levels "LAYING","SITTING",..: 3 2 1 4 5 6 3 2 1 4 ...
 $ tBodyAcc-mean()-X          : num  0.278 0.277 0.281 0.276 0.278 ...
 $ tBodyAcc-mean()-Y          : num  -0.0184 -0.0157 -0.0182 -0.0186 -0.0227 ...
 $ tBodyAcc-mean()-Z          : num  -0.106 -0.109 -0.107 -0.106 -0.117 ...
 $ tBodyAcc-std()-X           : num  -0.9873 -0.9868 -0.9741 -0.4236 0.0464 ...
 $ tBodyAcc-std()-Y           : num  -0.9573 -0.9507 -0.9803 -0.0781 0.2629 ...
 $ tBodyAcc-std()-Z           : num  -0.95 -0.96 -0.984 -0.425 -0.103 ...
 $ tGravityAcc-mean()-X       : num  0.897 0.94 -0.51 0.913 0.862 ...
 $ tGravityAcc-mean()-Y       : num  -0.37 -0.106 0.753 -0.347 -0.326 ...
 $ tGravityAcc-mean()-Z       : num  0.1297 0.1987 0.6468 0.0847 -0.0439 ...
 $ tGravityAcc-std()-X        : num  -0.987 -0.98 -0.959 -0.973 -0.94 ...
 $ tGravityAcc-std()-Y        : num  -0.974 -0.957 -0.988 -0.972 -0.94 ...
 $ tGravityAcc-std()-Z        : num  -0.946 -0.954 -0.984 -0.972 -0.931 ...
 $ tBodyAccJerk-mean()-X      : num  0.0748 0.0723 0.0826 0.0618 0.11 ...
 $ tBodyAccJerk-mean()-Y      : num  0.01033 0.0117 0.01225 0.01825 -0.00328 ...
 $ tBodyAccJerk-mean()-Z      : num  -0.00837 0.00761 -0.0018 0.0079 -0.02094 ...
 $ tBodyAccJerk-std()-X       : num  -0.981 -0.988 -0.986 -0.278 0.147 ...
 $ tBodyAccJerk-std()-Y       : num  -0.9711 -0.978 -0.9832 -0.0166 0.1268 ...
 $ tBodyAccJerk-std()-Z       : num  -0.983 -0.988 -0.988 -0.586 -0.34 ...
 $ tBodyGyro-mean()-X         : num  -0.0239 -0.0455 -0.0185 -0.053 -0.1159 ...
 $ tBodyGyro-mean()-Y         : num  -0.08204 -0.05993 -0.1118 -0.04824 -0.00482 ...
 $ tBodyGyro-mean()-Z         : num  0.0878 0.0412 0.1449 0.0828 0.0972 ...
 $ tBodyGyro-std()-X          : num  -0.973 -0.986 -0.988 -0.562 -0.321 ...
 $ tBodyGyro-std()-Y          : num  -0.971 -0.979 -0.982 -0.538 -0.416 ...
 $ tBodyGyro-std()-Z          : num  -0.965 -0.96 -0.96 -0.481 -0.279 ...
 $ tBodyGyroJerk-mean()-X     : num  -0.1056 -0.0936 -0.102 -0.0819 -0.0581 ...
 $ tBodyGyroJerk-mean()-Y     : num  -0.0422 -0.0416 -0.0359 -0.0538 -0.0421 ...
 $ tBodyGyroJerk-mean()-Z     : num  -0.0547 -0.0436 -0.0702 -0.0515 -0.071 ...
 $ tBodyGyroJerk-std()-X      : num  -0.979 -0.99 -0.993 -0.39 -0.244 ...
 $ tBodyGyroJerk-std()-Y      : num  -0.983 -0.991 -0.99 -0.634 -0.469 ...
 $ tBodyGyroJerk-std()-Z      : num  -0.974 -0.986 -0.988 -0.435 -0.218 ...
 $ tBodyAccMag-mean()         : num  -0.966 -0.968 -0.977 -0.29 0.09 ...
 $ tBodyAccMag-std()          : num  -0.958 -0.953 -0.973 -0.423 0.216 ...
 $ tGravityAccMag-mean()      : num  -0.966 -0.968 -0.977 -0.29 0.09 ...
 $ tGravityAccMag-std()       : num  -0.958 -0.953 -0.973 -0.423 0.216 ...
 $ tBodyAccJerkMag-mean()     : num  -0.98049 -0.98677 -0.98774 -0.28142 0.00566 ...
 $ tBodyAccJerkMag-std()      : num  -0.977 -0.984 -0.986 -0.164 0.23 ...
 $ tBodyGyroMag-mean()        : num  -0.963 -0.946 -0.95 -0.447 -0.162 ...
 $ tBodyGyroMag-std()         : num  -0.954 -0.961 -0.961 -0.553 -0.275 ...
 $ tBodyGyroJerkMag-mean()    : num  -0.984 -0.991 -0.992 -0.548 -0.411 ...
 $ tBodyGyroJerkMag-std()     : num  -0.977 -0.99 -0.99 -0.558 -0.343 ...
 $ fBodyAcc-mean()-X          : num  -0.984 -0.986 -0.977 -0.346 0.113 ...
 $ fBodyAcc-mean()-Y          : num  -0.9599 -0.9573 -0.9798 -0.0219 0.2783 ...
 $ fBodyAcc-mean()-Z          : num  -0.962 -0.97 -0.984 -0.454 -0.131 ...
 $ fBodyAcc-std()-X           : num  -0.9891 -0.9874 -0.9732 -0.4577 0.0161 ...
 $ fBodyAcc-std()-Y           : num  -0.958 -0.95 -0.981 -0.169 0.172 ...
 $ fBodyAcc-std()-Z           : num  -0.946 -0.957 -0.985 -0.455 -0.162 ...
 $ fBodyAccJerk-mean()-X      : num  -0.981 -0.988 -0.986 -0.305 0.138 ...
 $ fBodyAccJerk-mean()-Y      : num  -0.9709 -0.9771 -0.9828 -0.0788 0.0962 ...
 $ fBodyAccJerk-mean()-Z      : num  -0.98 -0.985 -0.986 -0.555 -0.271 ...
 $ fBodyAccJerk-std()-X       : num  -0.983 -0.989 -0.987 -0.314 0.05 ...
 $ fBodyAccJerk-std()-Y       : num  -0.9735 -0.9808 -0.985 -0.0153 0.0808 ...
 $ fBodyAccJerk-std()-Z       : num  -0.985 -0.989 -0.989 -0.616 -0.408 ...
 $ fBodyGyro-mean()-X         : num  -0.967 -0.983 -0.986 -0.43 -0.146 ...
 $ fBodyGyro-mean()-Y         : num  -0.973 -0.982 -0.983 -0.555 -0.362 ...
 $ fBodyGyro-mean()-Z         : num  -0.9606 -0.9598 -0.9627 -0.3967 -0.0875 ...
 $ fBodyGyro-std()-X          : num  -0.975 -0.987 -0.989 -0.604 -0.379 ...
 $ fBodyGyro-std()-Y          : num  -0.971 -0.977 -0.982 -0.533 -0.459 ...
 $ fBodyGyro-std()-Z          : num  -0.97 -0.964 -0.963 -0.56 -0.423 ...
 $ fBodyAccMag-mean()         : num  -0.964 -0.961 -0.975 -0.324 0.293 ...
 $ fBodyAccMag-std()          : num  -0.9605 -0.9556 -0.9751 -0.5771 -0.0215 ...
 $ fBodyBodyAccJerkMag-mean() : num  -0.977 -0.984 -0.985 -0.169 0.222 ...
 $ fBodyBodyAccJerkMag-std()  : num  -0.975 -0.984 -0.985 -0.164 0.227 ...
 $ fBodyBodyGyroMag-mean()    : num  -0.962 -0.972 -0.972 -0.531 -0.321 ...
 $ fBodyBodyGyroMag-std()     : num  -0.957 -0.961 -0.961 -0.652 -0.373 ...
 $ fBodyBodyGyroJerkMag-mean(): num  -0.978 -0.99 -0.99 -0.583 -0.38 ...
 $ fBodyBodyGyroJerkMag-std() : num  -0.978 -0.99 -0.989 -0.558 -0.344 ...
 - attr(*, ".internal.selfref")=<externalptr> 
 
 `````


Show the first 10 rows and the first 4 columns of the Tidydata
--------------------------------------------------------------


```r
TidyData
```

```
SubjectID           Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y
 1:         1           STANDING         0.2789176      -0.016137590
 2:         1            SITTING         0.2612376      -0.001308288
 3:         1             LAYING         0.2215982      -0.040513953
 4:         1            WALKING         0.2773308      -0.017383819
 5:         1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505
 6:         1   WALKING_UPSTAIRS         0.2554617      -0.023953149
 7:         2           STANDING         0.2779115      -0.018420827
 8:         2            SITTING         0.2770874      -0.015687994
 9:         2             LAYING         0.2813734      -0.018158740
10:         2            WALKING         0.2764266      -0.018594920
```


Summary of 68 variables from TidyData
--------------------


```r
summary(TidyData)
```

```
SubjectID                  Activity  tBodyAcc-mean()-X tBodyAcc-mean()-Y  
 Min.   : 1.0   LAYING            :30   Min.   :0.2216    Min.   :-0.040514  
 1st Qu.: 8.0   SITTING           :30   1st Qu.:0.2712    1st Qu.:-0.020022  
 Median :15.5   STANDING          :30   Median :0.2770    Median :-0.017262  
 Mean   :15.5   WALKING           :30   Mean   :0.2743    Mean   :-0.017876  
 3rd Qu.:23.0   WALKING_DOWNSTAIRS:30   3rd Qu.:0.2800    3rd Qu.:-0.014936  
 Max.   :30.0   WALKING_UPSTAIRS  :30   Max.   :0.3015    Max.   :-0.001308  
 tBodyAcc-mean()-Z  tBodyAcc-std()-X  tBodyAcc-std()-Y   tBodyAcc-std()-Z 
 Min.   :-0.15251   Min.   :-0.9961   Min.   :-0.99024   Min.   :-0.9877  
 1st Qu.:-0.11207   1st Qu.:-0.9799   1st Qu.:-0.94205   1st Qu.:-0.9498  
 Median :-0.10819   Median :-0.7526   Median :-0.50897   Median :-0.6518  
 Mean   :-0.10916   Mean   :-0.5577   Mean   :-0.46046   Mean   :-0.5756  
 3rd Qu.:-0.10443   3rd Qu.:-0.1984   3rd Qu.:-0.03077   3rd Qu.:-0.2306  
 Max.   :-0.07538   Max.   : 0.6269   Max.   : 0.61694   Max.   : 0.6090  
 tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z tGravityAcc-std()-X
 Min.   :-0.6800      Min.   :-0.47989     Min.   :-0.49509     Min.   :-0.9968    
 1st Qu.: 0.8376      1st Qu.:-0.23319     1st Qu.:-0.11726     1st Qu.:-0.9825    
 Median : 0.9208      Median :-0.12782     Median : 0.02384     Median :-0.9695    
 Mean   : 0.6975      Mean   :-0.01621     Mean   : 0.07413     Mean   :-0.9638    
 3rd Qu.: 0.9425      3rd Qu.: 0.08773     3rd Qu.: 0.14946     3rd Qu.:-0.9509    
 Max.   : 0.9745      Max.   : 0.95659     Max.   : 0.95787     Max.   :-0.8296    
 tGravityAcc-std()-Y tGravityAcc-std()-Z tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y
 Min.   :-0.9942     Min.   :-0.9910     Min.   :0.04269       Min.   :-0.0386872   
 1st Qu.:-0.9711     1st Qu.:-0.9605     1st Qu.:0.07396       1st Qu.: 0.0004664   
 Median :-0.9590     Median :-0.9450     Median :0.07640       Median : 0.0094698   
 Mean   :-0.9524     Mean   :-0.9364     Mean   :0.07947       Mean   : 0.0075652   
 3rd Qu.:-0.9370     3rd Qu.:-0.9180     3rd Qu.:0.08330       3rd Qu.: 0.0134008   
 Max.   :-0.6436     Max.   :-0.6102     Max.   :0.13019       Max.   : 0.0568186   
 tBodyAccJerk-mean()-Z tBodyAccJerk-std()-X tBodyAccJerk-std()-Y tBodyAccJerk-std()-Z
 Min.   :-0.067458     Min.   :-0.9946      Min.   :-0.9895      Min.   :-0.99329    
 1st Qu.:-0.010601     1st Qu.:-0.9832      1st Qu.:-0.9724      1st Qu.:-0.98266    
 Median :-0.003861     Median :-0.8104      Median :-0.7756      Median :-0.88366    
 Mean   :-0.004953     Mean   :-0.5949      Mean   :-0.5654      Mean   :-0.73596    
 3rd Qu.: 0.001958     3rd Qu.:-0.2233      3rd Qu.:-0.1483      3rd Qu.:-0.51212    
 Max.   : 0.038053     Max.   : 0.5443      Max.   : 0.3553      Max.   : 0.03102    
 tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z tBodyGyro-std()-X tBodyGyro-std()-Y
 Min.   :-0.20578   Min.   :-0.20421   Min.   :-0.07245   Min.   :-0.9943   Min.   :-0.9942  
 1st Qu.:-0.04712   1st Qu.:-0.08955   1st Qu.: 0.07475   1st Qu.:-0.9735   1st Qu.:-0.9629  
 Median :-0.02871   Median :-0.07318   Median : 0.08512   Median :-0.7890   Median :-0.8017  
 Mean   :-0.03244   Mean   :-0.07426   Mean   : 0.08744   Mean   :-0.6916   Mean   :-0.6533  
 3rd Qu.:-0.01676   3rd Qu.:-0.06113   3rd Qu.: 0.10177   3rd Qu.:-0.4414   3rd Qu.:-0.4196  
 Max.   : 0.19270   Max.   : 0.02747   Max.   : 0.17910   Max.   : 0.2677   Max.   : 0.4765  
 tBodyGyro-std()-Z tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
 Min.   :-0.9855   Min.   :-0.15721       Min.   :-0.07681       Min.   :-0.092500     
 1st Qu.:-0.9609   1st Qu.:-0.10322       1st Qu.:-0.04552       1st Qu.:-0.061725     
 Median :-0.8010   Median :-0.09868       Median :-0.04112       Median :-0.053430     
 Mean   :-0.6164   Mean   :-0.09606       Mean   :-0.04269       Mean   :-0.054802     
 3rd Qu.:-0.3106   3rd Qu.:-0.09110       3rd Qu.:-0.03842       3rd Qu.:-0.048985     
 Max.   : 0.5649   Max.   :-0.02209       Max.   :-0.01320       Max.   :-0.006941     
 tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y tBodyGyroJerk-std()-Z tBodyAccMag-mean()
 Min.   :-0.9965       Min.   :-0.9971       Min.   :-0.9954       Min.   :-0.9865   
 1st Qu.:-0.9800       1st Qu.:-0.9832       1st Qu.:-0.9848       1st Qu.:-0.9573   
 Median :-0.8396       Median :-0.8942       Median :-0.8610       Median :-0.4829   
 Mean   :-0.7036       Mean   :-0.7636       Mean   :-0.7096       Mean   :-0.4973   
 3rd Qu.:-0.4629       3rd Qu.:-0.5861       3rd Qu.:-0.4741       3rd Qu.:-0.0919   
 Max.   : 0.1791       Max.   : 0.2959       Max.   : 0.1932       Max.   : 0.6446   
 tBodyAccMag-std() tGravityAccMag-mean() tGravityAccMag-std() tBodyAccJerkMag-mean()
 Min.   :-0.9865   Min.   :-0.9865       Min.   :-0.9865      Min.   :-0.9928       
 1st Qu.:-0.9430   1st Qu.:-0.9573       1st Qu.:-0.9430      1st Qu.:-0.9807       
 Median :-0.6074   Median :-0.4829       Median :-0.6074      Median :-0.8168       
 Mean   :-0.5439   Mean   :-0.4973       Mean   :-0.5439      Mean   :-0.6079       
 3rd Qu.:-0.2090   3rd Qu.:-0.0919       3rd Qu.:-0.2090      3rd Qu.:-0.2456       
 Max.   : 0.4284   Max.   : 0.6446       Max.   : 0.4284      Max.   : 0.4345       
 tBodyAccJerkMag-std() tBodyGyroMag-mean() tBodyGyroMag-std() tBodyGyroJerkMag-mean()
 Min.   :-0.9946       Min.   :-0.9807     Min.   :-0.9814    Min.   :-0.99732       
 1st Qu.:-0.9765       1st Qu.:-0.9461     1st Qu.:-0.9476    1st Qu.:-0.98515       
 Median :-0.8014       Median :-0.6551     Median :-0.7420    Median :-0.86479       
 Mean   :-0.5842       Mean   :-0.5652     Mean   :-0.6304    Mean   :-0.73637       
 3rd Qu.:-0.2173       3rd Qu.:-0.2159     3rd Qu.:-0.3602    3rd Qu.:-0.51186       
 Max.   : 0.4506       Max.   : 0.4180     Max.   : 0.3000    Max.   : 0.08758       
 tBodyGyroJerkMag-std() fBodyAcc-mean()-X fBodyAcc-mean()-Y  fBodyAcc-mean()-Z
 Min.   :-0.9977        Min.   :-0.9952   Min.   :-0.98903   Min.   :-0.9895  
 1st Qu.:-0.9805        1st Qu.:-0.9787   1st Qu.:-0.95361   1st Qu.:-0.9619  
 Median :-0.8809        Median :-0.7691   Median :-0.59498   Median :-0.7236  
 Mean   :-0.7550        Mean   :-0.5758   Mean   :-0.48873   Mean   :-0.6297  
 3rd Qu.:-0.5767        3rd Qu.:-0.2174   3rd Qu.:-0.06341   3rd Qu.:-0.3183  
 Max.   : 0.2502        Max.   : 0.5370   Max.   : 0.52419   Max.   : 0.2807  
 fBodyAcc-std()-X  fBodyAcc-std()-Y   fBodyAcc-std()-Z  fBodyAccJerk-mean()-X
 Min.   :-0.9966   Min.   :-0.99068   Min.   :-0.9872   Min.   :-0.9946      
 1st Qu.:-0.9820   1st Qu.:-0.94042   1st Qu.:-0.9459   1st Qu.:-0.9828      
 Median :-0.7470   Median :-0.51338   Median :-0.6441   Median :-0.8126      
 Mean   :-0.5522   Mean   :-0.48148   Mean   :-0.5824   Mean   :-0.6139      
 3rd Qu.:-0.1966   3rd Qu.:-0.07913   3rd Qu.:-0.2655   3rd Qu.:-0.2820      
 Max.   : 0.6585   Max.   : 0.56019   Max.   : 0.6871   Max.   : 0.4743      
 fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z fBodyAccJerk-std()-X fBodyAccJerk-std()-Y
 Min.   :-0.9894       Min.   :-0.9920       Min.   :-0.9951      Min.   :-0.9905     
 1st Qu.:-0.9725       1st Qu.:-0.9796       1st Qu.:-0.9847      1st Qu.:-0.9737     
 Median :-0.7817       Median :-0.8707       Median :-0.8254      Median :-0.7852     
 Mean   :-0.5882       Mean   :-0.7144       Mean   :-0.6121      Mean   :-0.5707     
 3rd Qu.:-0.1963       3rd Qu.:-0.4697       3rd Qu.:-0.2475      3rd Qu.:-0.1685     
 Max.   : 0.2767       Max.   : 0.1578       Max.   : 0.4768      Max.   : 0.3498     
 fBodyAccJerk-std()-Z fBodyGyro-mean()-X fBodyGyro-mean()-Y fBodyGyro-mean()-Z
 Min.   :-0.993108    Min.   :-0.9931    Min.   :-0.9940    Min.   :-0.9860   
 1st Qu.:-0.983747    1st Qu.:-0.9697    1st Qu.:-0.9700    1st Qu.:-0.9624   
 Median :-0.895121    Median :-0.7300    Median :-0.8141    Median :-0.7909   
 Mean   :-0.756489    Mean   :-0.6367    Mean   :-0.6767    Mean   :-0.6044   
 3rd Qu.:-0.543787    3rd Qu.:-0.3387    3rd Qu.:-0.4458    3rd Qu.:-0.2635   
 Max.   :-0.006236    Max.   : 0.4750    Max.   : 0.3288    Max.   : 0.4924   
 fBodyGyro-std()-X fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-mean() fBodyAccMag-std()
 Min.   :-0.9947   Min.   :-0.9944   Min.   :-0.9867   Min.   :-0.9868    Min.   :-0.9876  
 1st Qu.:-0.9750   1st Qu.:-0.9602   1st Qu.:-0.9643   1st Qu.:-0.9560    1st Qu.:-0.9452  
 Median :-0.8086   Median :-0.7964   Median :-0.8224   Median :-0.6703    Median :-0.6513  
 Mean   :-0.7110   Mean   :-0.6454   Mean   :-0.6577   Mean   :-0.5365    Mean   :-0.6210  
 3rd Qu.:-0.4813   3rd Qu.:-0.4154   3rd Qu.:-0.3916   3rd Qu.:-0.1622    3rd Qu.:-0.3654  
 Max.   : 0.1966   Max.   : 0.6462   Max.   : 0.5225   Max.   : 0.5866    Max.   : 0.1787  
 fBodyBodyAccJerkMag-mean() fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-mean()
 Min.   :-0.9940            Min.   :-0.9944           Min.   :-0.9865        
 1st Qu.:-0.9770            1st Qu.:-0.9752           1st Qu.:-0.9616        
 Median :-0.7940            Median :-0.8126           Median :-0.7657        
 Mean   :-0.5756            Mean   :-0.5992           Mean   :-0.6671        
 3rd Qu.:-0.1872            3rd Qu.:-0.2668           3rd Qu.:-0.4087        
 Max.   : 0.5384            Max.   : 0.3163           Max.   : 0.2040        
 fBodyBodyGyroMag-std() fBodyBodyGyroJerkMag-mean() fBodyBodyGyroJerkMag-std()
 Min.   :-0.9815        Min.   :-0.9976             Min.   :-0.9976           
 1st Qu.:-0.9488        1st Qu.:-0.9813             1st Qu.:-0.9802           
 Median :-0.7727        Median :-0.8779             Median :-0.8941           
 Mean   :-0.6723        Mean   :-0.7564             Mean   :-0.7715           
 3rd Qu.:-0.4277        3rd Qu.:-0.5831             3rd Qu.:-0.6081           
 Max.   : 0.2367        Max.   : 0.1466             Max.   : 0.2878       
```


