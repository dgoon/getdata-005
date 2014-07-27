source("prepare_data.R")
library('plyr')  # to use join

# Read raw data and metadata files
print("Reading raw data and metadata files", quote=FALSE)
x_test = read.table('./data/UCI HAR Dataset/test/X_test.txt')
y_test = read.table('./data/UCI HAR Dataset/test/Y_test.txt')
s_test = read.table('./data/UCI HAR Dataset/test/subject_test.txt')
x_train = read.table('./data/UCI HAR Dataset/train/X_train.txt')
y_train = read.table('./data/UCI HAR Dataset/train/Y_train.txt')
s_train = read.table('./data/UCI HAR Dataset/train/subject_train.txt')
x_names = read.table('./data/UCI HAR Dataset/features.txt')
activity_names = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Merge test and train datasets.
print("Merging test and train datasets", quote=FALSE)
x_full = rbind(x_test, x_train)
y_full = rbind(y_test, y_train)
s_full = rbind(s_test, s_train)

# Also, give descriptive names to each columns
print("Giving descriptive names to each columns", quote=FALSE)
names(x_full) <- x_names$V2
names(s_full) <- c("Subject")
names(y_full) <- c("ActivityCode")
names(activity_names) <- c("ActivityCode", "Activity")
y_full <- join(y_full, activity_names)

# Extract only mean and stddev of each measurement
print("Extracting only mean and stddev of each measurements", quote=FALSE)
target_idx = grep("*-mean\\(\\)|*-std\\(\\)", x_names$V2)
x_selected = x_full[target_idx]

# Ok, now dataset with selected features are ready
print("Combining selected features, subject and activity columns", quote=FALSE)
selected_dataset = cbind(x_selected, s_full, y_full)

# Let's summary the dataset with two variables: ActivityCode and Subject
print("Summarizing combined dataset by ('Subject', 'Activity')", quote=FALSE)
sd_names = names(selected_dataset)
group_cols = c("Subject", "Activity")
data_cols = sd_names[grep("*-mean|*-std", sd_names)]
tidy_dataset = ddply(selected_dataset, group_cols,
        function (x) colSums(x[data_cols]))

# Write tidy_dataset.csv, without header
print('Writing tidy dataset to "./data/tidy_dataset.csv.txt",', quote=FALSE)
print('  and column info to "./data/tidy_dataset_col_names.txt".', quote=FALSE)
write.table(tidy_dataset, "./data/tidy_dataset.csv.txt", sep=",",
        row.names=FALSE, col.names=TRUE, quote=FALSE)
write(date(), file='./data/tidy_dataset.csv.txt.dateGenerated')
