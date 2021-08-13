directory<- "specdata"
id<- 1:10
pol <- "nitrate"
finalMean <- ""
mergedDF <- ""
counter <- 0

if (length(id) == 1){
  df <- read.csv(paste(directory, "/", sprintf( "%03d", id),".csv", sep = ""))
  finalMean <- mean(df[[pol]], na.rm = TRUE)
}else{
  for (i in id){
    if (counter == 0){
    df <- read.csv(paste(directory, "/", sprintf( "%03d", id),".csv", sep = ""))
    mergedDF <- df
    counter <- counter + 1
    }else{
      df <- read.csv(paste(directory, "/", sprintf( "%03d", id),".csv", sep = ""))
      mergedDF <- merge(mergedDF, df)
      finalMean <- mean(mergedDF[[pol]],na.rm = TRUE)
    }
  }
}

mergedDF
#accumulatedMean <- mean(df$pol, na.rm = FALSE)
#accumulatedMean

