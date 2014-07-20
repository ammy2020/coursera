corr <- function(directory, threshold = 0){
    res <- numeric(0)
    for(fileName in list.files(directory, full.name=T)){
        file <- file(fileName, 'r')
        data <- read.csv(file)
        subcount <- sum(complete.cases(data))
        #print(paste(fileName, subcount, sep=" has subcount : "))
        if(subcount > threshold){
            res <- append(res, cor(data$sulfate, data$nitrate, use="complete.obs"))
        }
        close(file)
    }
    round(res, 5)
}