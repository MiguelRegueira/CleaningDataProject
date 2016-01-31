# This function return a data frame with readable column names of mean and sdt variables
# together with the activity done and the subject who performed the activity
# Inputs:
## varFile - File path with experiment observations
## actFile - File path with the records of the activity performed for each of the observations
## subjectFile - File path with the subject who performed the activity
## varNames - A list with the observation names to be stored
## actNames - A list of mapping names from activity number to ("LAYING","SITTING","STANDING", 
## "WALKING", "WALKING_DOWNSTAIRS", "WALKING_UPSTAIRS")
read.data <- function(varFile,actFile,subjectFile,varNames,actNames){
  # read columns containing mean or sdt variables name
  keeps <- varNames %in% grep("(.*mean\\(\\).*)|(.*std\\(\\).*)",varNames,value = TRUE)
  colClasses <- lapply(keeps,function(x) if(x){"numeric"}else{"NULL"})
  
  # Load test data
  data <- read.fwf(varFile, 
                   widths = rep.int(16, 561), header = FALSE,
                   col.names = varNames, colClasses = colClasses, 
                   buffersize = 500)
  
  # load the acticity list and rename it to a more understandable value
  act <- read.table(actFile)
  act <- sapply(act,function(x) actNames[x])
  data$Activity <- act[,1]
  
  #load the subjects who performed the experiment
  subject <- read.table(subjectFile)
  data$Subject <- subject[,1]
  
  return(data)
}

# Create data folder if it doesn't exist
if(!file.exists("./data")){dir.create("./data")}

# Download the data into a temp file and extract it in data folder
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
unzip(temp, exdir = "./data")

# Delete the temporal zip file
unlink(temp)

# Load features and activity
varNames <- read.table("./data/UCI HAR Dataset/features.txt")[[2]]
actNames <- read.table("./data/UCI HAR Dataset/activity_labels.txt")[[2]]

# Read the data from test observations
data <- read.data(varFile = "./data/UCI HAR Dataset/test/X_test.txt", 
                  actFile = "./data/UCI HAR Dataset/test/y_test.txt",
                  subjectFile = "./data/UCI HAR Dataset/test/subject_test.txt", 
                  varNames = varNames, actNames = actNames)

# Read the data from train observations
data2 <- read.data(varFile = "./data/UCI HAR Dataset/train/X_train.txt", 
                  actFile = "./data/UCI HAR Dataset/train/y_train.txt",
                  subjectFile = "./data/UCI HAR Dataset/train/subject_train.txt", 
                  varNames = varNames, actNames = actNames)

# Merge data from test and train observations
data <- rbind(data, data2, make.row.names=FALSE)
data2 <- NULL

# Make a copy of merged data in file 
write.table(data, "./tidyDataset.txt", row.name=FALSE) 

# Compute the average of each variable for each activity and each subject
dataAvg <- aggregate(data[,1:66],list(data$Activity,data$Subject),mean)

# Rename columnames
dataAvg <- rename(dataAvg, c("Group.1"="Activity", "Group.2"="Subject"))

# Make a copy of merged data in file 
write.table(dataAvg, "./averageTidyDataset.txt", row.name=FALSE)
