# Download the zip file is not downloaded

download_curl <- function(src, dst) {
    if (!file.exists(dst)) {
        download.file(src, dst, method="curl", extra="-k")
    }
    return(file.exists(dst))
}

download_wget <- function(src, dst) {
    if (!file.exists(dest)) {
        download.file(src, dst, method="wget")
    }
    return(file.exists(dst))
}

download <- function(src, dst) {
    if (file.exists(dst))
        return(TRUE)

    fs <- c(download_curl, download_wget)
    for (f in fs) {
        succeeded = f(src, dst)
        if (succeeded) {
            write(date(), file=paste(dst, 'dateDownloaded', sep='.'))
            print("Downloaded")
            return(TRUE)
        }
    }
    return(FALSE)
}
