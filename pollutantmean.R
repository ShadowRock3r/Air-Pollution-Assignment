pollutantmean <- function( directory = "specdata", pollutant = "nitrate", id = 1) {
  counter <- 0
  df <- data.frame()
  if (pollutant == "nitrate"| pollutant == "sulfate"){
    if (length(id) == 1){
      if (id >= 1 && id <= 332){
        
        #reads the correspondent csv file
        df <- read.csv(paste0(directory,"/",sprintf( "%03d",id ),".csv"))
        print(mean(df[[pollutant]], na.rm = TRUE))
        
      }else{
        print(paste( id, "is not a valid id, The id must be between 1 and 332!"))
      }
      
    }else{ 
      for( i in id){
        
        if (id[i] >= 1 && id[i] <= 332){
          tempdf <- read.csv(paste0(directory,"/",sprintf( "%03d",id[i] ),".csv"))
          df <- rbind(df, tempdf)
          #counter <- counter + 1
          
        #}else if(id[i] >= 1 && id[i] <= 332 && counter > 0){
          #tempdf <- read.csv(paste0(directory,"/",sprintf( "%03d",id[i] ),".csv"))
          #df <- rbind(df, tempdf)
          
        }else{
          print(paste( id[i], "is not a valid id, The id must be between 1 and 332!"))
        }
      }
      print(mean(df[[pollutant]], na.rm = TRUE))
      
      }
  }else{
    print("Enter 'nitrate' or 'sulfate' as a pollutant.")
  }
}
    
    