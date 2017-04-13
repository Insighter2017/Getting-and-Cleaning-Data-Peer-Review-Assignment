# Getting and Cleaning Data
## Peer Review Assignment
#### Submitted by Shelby Brambach
#### April 12, 2017</H4>

## Objective:  Collect, Manipulate, and Clean the Data Set

### Files submitted with this project:
<OL>
<li>Cookbook: Cites data source and link to design of experiments.  Provides measurement units for hi-level activities</li>
<li>dataSet1_Mean_and_SD_Only.txt: Tidy data set with Mean and SD for each activity</li>
<li>dataSet2_averages.txt: Tidy data set with average for each activity</li>
<li>run_analysis.R: The annotated logic that produces both data sets</li>
</OL>

### The project's objective is to provide two tidy data sets from the data sources provided by the instruction team.
* Blend the training and test data sets
* For each of the activities in the data set, pattern search the variables and remove the mean and sd suffixes
* Create one data set that calculates only the mean and standard deviation for each activity
* Create separate data set that calculates only the average for each activity.
* Use only one R script to generate both data sets.

The code creates three separate training and test data sets (X, subject, and y), assigns factor variable names to these tables, and performs a series grep and other string oprations to tidy the data.  Once these tables have been tidied, they are consolidated into the data sets required by this project.

The walkthrough of this code is provided in the CodeBook.md.


### Citations

The data subset used for this class project is taken from the following source.

Project Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Research and Source Data: 
* Lichman, M. (2013). UCI Machine Learning Repository [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information and Computer Science.

* BiBTeX citation: @misc{Lichman:2013, author = "M. Lichman", year = "2013", title = "{UCI} Machine Learning Repository", url = "http://archive.ics.uci.edu/ml", institution = "University of California, Irvine, School of Information and Computer Sciences" } 

## Design of Experiments: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
