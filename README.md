## Purpose

This project's purpose is to generate tidy dataset from the provided rawdata.

The tidy dataset should be summarized as average of each data column by the two factor: 'Subject' and 'Activity'. The feature vector is originally 561-dimensions in rawdata. Only 68 features are selected.

Detailed information about each variables is in CodeBook.md and rawdata's features\_info.txt.

## Requirements

* library(plyr): join, ddply
* curl(MacOSX) or wget(linux)
* Initial rawdata downloading requires network connection (60MB)
* About 350MB of disk space including downloaded file.

## Instructions

The following instructions will reproduce the results.
Only tested in **MacOSX**. It may work in linux environment too, but not tested.

1. Take the rawdata file and unzip it.

    url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    prepare_data.R file does both download and unzip for you.

    $ R --quiet -f prepare_data.R     # in terminal

    or

    > source("prepare_data.R")        # in interactive R session

    will work. If you're not in MacOSX, R's download.file function could fail. In that case, please download the file in the directory './data' and unzip it in the directory.

    Once the rawdata is ready, prepare_data.R will not redownload.

2. Execute run\_analysis.R

    $ R --quiet -f run\_analysis.R      # in terminal

    or

    > source("run\_analysis.R")         # in interactiv R session

    run_analysis.R will process rawdata to generate the file: ./data/tidy_dataset.csv.txt

## Comments

Because git is not suitable to store big data files, rawdata is **not** included in the repository.