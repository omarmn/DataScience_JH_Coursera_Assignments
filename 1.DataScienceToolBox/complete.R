complete <- function(directory, id = 1:332) {
        
        poll_mon <- data.frame(Date=factor(),sulfate=numeric(),nitrate=numeric(),ID=integer())
        
        if(length(id)==1) {
                if(id>=1 && id<=9){
                        filename <- paste(directory,"/","00",as.character(id[1]),".csv",sep="")      
                }else if (id>=10 && id<=99){
                        filename <- paste(directory,"/","0",as.character(id[1]),".csv",sep="")
                } else if (id>=100 && id<=999){
                        filename <- paste(directory,"/",as.character(id[1]),".csv",sep="")
                }
                poll_mon <- read.csv(filename)
        } else {
                for(i in 1:length(id)){
                        if(id[i]>=1 && id[i]<=9){
                                filename <- paste(directory,"/","00",as.character(id[i]),".csv",sep="")      
                        }else if (id[i]>=10 && id[i]<=99){
                                filename <- paste(directory,"/","0",as.character(id[i]),".csv",sep="")
                        } else if (id[i]>=100 && id[i]<=999){
                                filename <- paste(directory,"/",as.character(id[i]),".csv",sep="")
                        }
                        temp <- read.csv(filename)
                        poll_mon <- rbind(poll_mon,temp)       
                }
                
                
        }

        good <- complete.cases(poll_mon)
        santised_poll_mon <- poll_mon [good, ]
        
        temptable=table(santised_poll_mon$ID)
        id_nobs=as.data.frame(temptable)
        names(id_nobs)[1]='id'
        names(id_nobs)[2]='nobs'
        return(id_nobs)        
}