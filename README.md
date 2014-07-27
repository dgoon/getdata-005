## Motivation

Course project of [Getting and Cleaning Data](https://class.coursera.org/getdata-005) class.

## Purpose

This project's purpose is to generate tidy dataset from the provided rawdata.

Detailed information about each variables is in [CodeBook.md](CodeBook.md) and rawdata's [features\_info.txt](data/UCI HAR Dataset/features_info.txt).

## Requirements

* library(plyr): join, ddply
* curl/wget for downloading
* unzip
* Initial rawdata downloading requires network connection (60MB)
* About 350MB of disk space including downloaded file.

## Instructions

The following instructions will reproduce the results.
Only tested in **MacOSX** and **R Ver 3.0.2**. It may work in linux environment too, but **not** tested.

1. Take the rawdata file and unzip it.

    url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

    [*prepare_data.R*](prepare_data.R) file will do both downloading and unzipping for you.

    `$ R --quiet -f prepare_data.R     # in terminal`

    or

    `> source("prepare_data.R")        # in interactive R session`

    If you're not in MacOSX, R's `download.file` function could fail. (Check: [*download_data.R*](download_data.R))
    In that case, please download the file in the directory *./data* and unzip it in the directory **manually**.

    Once the rawdata is ready, [*prepare_data.R*](prepare_data.R) will not redownload.

2. Execute [*run_analysis.R*](run_analysis.R)

    `$ R --quiet -f run_analysis.R      # in terminal`

    or

    `> source("run_analysis.R")         # in interactive R session`

    [*run_analysis.R*](run_analysis.R) will process rawdata to generate the file: [./data/tidy_dataset.csv.txt](data/tidy_dataset.csv.txt)

## Comments

Because git is not suitable to store big data files, rawdata is **not** included in the repository. [features_info.txt](./data/UCI HAR Dataset/features_info.txt) is specially picked to be put in the repository, because it has metadata description needed for tidy dataset's [Codebook](CodeBook.md).
