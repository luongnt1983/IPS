# IPS
WiFi fingerprinting system
This is a repository for a WiFi fingerprinting dataset collected in different environmental conditions
such as the density of people, the subject direction, the period in a day, etc

There are two folders named “Offline” and “Online”.

"Offline" folder has "Training_Data" file which has RSS values collected from 205 RPs to build the radio map. 
To see the mean value of each AP at each RP, you can run the file IPS_Offline.m

"Online" folder has data for two test cases "Case1" and "Case2".
To see the positioning results using two algorithms (i.e. KNN and WKNN) at each RP, 
you can run the file IPS_KNN_WKNN_Case1.m and IPS_KNN_WKNN_Case2.m
