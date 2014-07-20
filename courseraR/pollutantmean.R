pollutantmean <- function(directory, pollutant, id = 1:332){
    total <- 0
    rowsCount <-0
    data1<-data.frame()
    for(num in id){
        filename <- paste("/",change(num),".csv",sep='')
        absolutePath <- paste(directory, filename,sep='')
        fileP <- file(absolutePath)
        data1 <- rbind(data1,read.csv(fileP))
    }
    if(pollutant == 'sulfate'){
        mean(data1$sulfate, na.rm=T)
    }else if(pollutant == 'nitrate'){
        mean(data1$nitrate, na.rm=T)
    }else{
        0
    }
}

change <- function(id){
    if(id < 10)
        paste('00', id, sep='')
    else if ( id > 9 && id < 100){
        paste('0', id, sep='')
    }else{
        id
    }
}

