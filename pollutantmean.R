pollutantmean <- function( directory, pollutant, id = 1:332) {
  
  df <- data.frame()
  
  if (pollutant == "nitrate"| pollutant == "sulfate"){
    if (length(id) == 1){
      if (id >= 1 && id <= 332){
        
        #reads the correspondent csv file
        df <- read.csv(paste0(directory,"/",sprintf( "%03d",id ),".csv"))
        print(mean(df[[pollutant]], na.rm = TRUE))
        
      }else{
        #Message in case of out of bounds id
        print(paste( id, "is not a valid id, The id must be between 1 and 332!"))
      }
      
    }else{ 
      for( i in id){
        
        if (i >= 1 && i <= 332){
          #temporary df variable to store the required datasets
          tempdf <- read.csv(paste0(directory,"/",sprintf( "%03d",i ),".csv"))
          
          #merging the required data in a unique data frame
          df <- rbind(df, tempdf)
        
        }else{
          #Message in case of out of bounds id
          print(paste( id[i], "is not a valid id, The id must be between 1 and 332!"))
          next
        }
      }
      #return 
      print(mean(df[[pollutant]], na.rm = TRUE))
    }
  }else{
    print("Enter 'nitrate' or 'sulfate' as a pollutant.")
  }
}

    
    