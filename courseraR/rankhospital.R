rankhospital <- function(state, outcome, num = "best") {
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
    rank <- as.numeric(1)#rank
    cls <- class(num)#num class
    subset <- db[, array] #data need to compute
    ss <- which(subset[,3] != "Not Available") #mark NA
    subset <- subset[ss,]# remove NA
    subset[,3] <- as.numeric(subset[,3])
    sdf <- which(subset$State == state)
    ssd <- subset[sdf,]
    ssd <- ssd[order(ssd[,1]),]
    minOrder <- order(ssd[,3])
    hps <-ssd[minOrder, 1]
    total <- length(hps)
    if(cls == "numeric"){
        rank <- num
        if(rank > total){
            NA
        }else{
            hps[rank]
        }
    }else{
        if(num == "best"){
            rank <-1
            hps[rank]
        }else if(num == "worst"){
            hps[total]
        }else{
            NA
        }
    }
}