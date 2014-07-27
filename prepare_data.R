source('download_data.R')

if (!file.exists("data")) { dir.create("data"); }
source_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_zip_file = "data/getdata-projectfiles-UCI HAR Dataset.zip"

if (!download(source_url, data_zip_file)) {
    stop(sprintf("Cannot download the url '%s'.\nPlease download the url as '%s.'.", source_url, data_zip_file))
}

if (!file.exists("data/UCI HAR Dataset")) {
    cur_dir = getwd()
    setwd("./data")
    system("unzip 'getdata-projectfiles-UCI HAR Dataset.zip'")
    setwd(cur_dir)
}

if (!file.exists("data/UCI HAR Dataset")) {
    stop(sprintf("Failed to unzip '%s'.\nPlease manually unzip the file to ensure that the data files are under '%s/data/UCI HAR Dataset/'.", data_zip_file, getwd()))
}

print("Rawdata is ready.", quote=FALSE)
