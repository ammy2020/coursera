rankall <- function(outcome, num = "best") {
    
    db <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
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
    
    
    subset <- db[, array] #data need to compute
    ss <- which(subset[,3] != "Not Available") #mark NA
    subset <- subset[ss,]# remove NA
    subset[,3] <- as.numeric(subset[,3])
    
    ssd <- subset[order(subset[,2]),]#order by state
    #how to devide by state
    
    magic <- split(ssd, as.factor(ssd[,2]))
    names <- names(magic)
    hospital <- NULL
    state <- NULL
    for(name in names){
        data<- magic[name]
        subframe <- data.frame(data)
        nameOrder <- order(subframe[,1])
        subframe <- subframe[nameOrder,]
        minOrder <- order(subframe[,3])
        hps <-subframe[minOrder, 1]
        total <- length(hps)
        state<- c(state , name)
        hospital <- c(hospital, extract(num, hps, total))
    }
    result <- data.frame(hospital, state)
}
extract <- function(num , hps, total){
    rank <- as.numeric(1)#rank
    cls <- class(num)#num class
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
