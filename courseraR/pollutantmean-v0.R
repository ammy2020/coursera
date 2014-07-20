pollutantmean <- function(directory, pollutant, id = 1:332){
  total <- 0
  rowsCount <-0
  for(num in id){
    filename <- paste("/",change(num),".csv",sep='')
    absolutePath <- paste(directory, filename,sep='')
    fileP <- file(absolutePath)
    data <- read.csv(fileP)
    sub <- mean(data[[pollutant]], na.rm=T)
    #print(paste(num, ':',sub))
    y <- (sub * nrow(data) + total)
    #print(paste('y <- ', sub ,'+', total))
    total <-y
    rowsCount <- rowsCount + nrow(data)
    #print(paste('total = ', total))
  }
  #print(paste(total, '/', length(id)))
  total/rowsCount
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

