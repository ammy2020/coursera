complete <- function(directory, id = 1:332){
    data <- data.frame();
    files <- list.files(directory, full.name=T)
    nobs <- NULL
    myid <- NULL
    for(fileId in id){
        file <- file(files[fileId], 'r')
        data <- read.csv(file)
        subcount <- sum(complete.cases(data))
        #print(subcount)
        nobs <- c(nobs, subcount)
        myid <- c(myid, fileId)
        close(file)
    }
    print(nobs)
    data.frame(myid, nobs)
}