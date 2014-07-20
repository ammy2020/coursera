best <- function(state, outcome){
    db <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    if(!state %in% db$State){
        stop("invalid state")
    }
    subset <- NULL
    array <- NULL
    if(outcome == "heart attack"){
        array <- c(2, 7, 11)
    }else if(outcome == "heart failure"){
        array <- c(2, 7, 17)
    }else if(outcome == "pneumonia"){
        array <- c(2, 7, 23)
    }else{
        stop("invalid outcome")
    }
    subset <- db[, array]
    sdf <- which(subset$State == state)
    ssd <- subset[sdf,]
    ssd[,3] <- as.numeric(ssd[,3])
    rowN <- min(ssd[, 3], na.rm=T)
    right <- which(ssd[,3] == rowN)
    hps <-ssd[right, 1]
    hps[order(hps)][1]
}