corr <- function(directory, threshold = 0){
  output <- NULL
  
  for (i in list.files(directory)){
    df <- read.csv(paste0(directory,"/",i ))
    df <- df[complete.cases(df),]
    if (nrow(df) > threshold){
      output <- append(output, cor( df$sulfate, df$nitrate))
    }
  }
  output
}