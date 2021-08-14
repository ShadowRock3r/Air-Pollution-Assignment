complete <- function( directory, id){

  if (length(id) == 1){
    if (id >= 1 && id <= 332){
      #reads the correspondent csv file
      df <- read.csv(paste0(directory,"/",sprintf( "%03d",id ),".csv"))
      nobs <- nrow(df[complete.cases(df),])
      
      #creates the outcome df with the required information
      df <- data.frame(id = id, nobs = nobs)
      df
      
    }else{
      print(paste( id, "is not a valid id, The id must be between 1 and 332!"))
    }
  }else{ 
    for( i in id){
      
      if (i >= 1 && i <= 332){
        df <- read.csv(paste0(directory,"/",sprintf( "%03d",i ),".csv"))
        nobsVector <- append(nobsVector, nrow(df[complete.cases(df),]) )
        ids <- append( ids, i)
        
      }else{
        print(paste( id[i], "is not a valid id, The id must be between 1 and 332!"))
      }
    }
    #creates the outcome df with the required information
    answer <- data.frame(id = ids, nobs = nobsVector, check.rows = TRUE, fix.empty.names = TRUE)
    #delete the empty first row
    answer <- answer[-1,]
    #Reset the row index
    rownames(answer)=NULL
    
    print(answer)
  }
}
