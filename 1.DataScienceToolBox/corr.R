corr <- function(directory, threshold = 0) {
        
        poll_mon <- data.frame(Date=factor(),sulfate=numeric(),nitrate=numeric(),ID=integer())
        corrr<-vector('numeric')
        
        allfiles <- list.files(directory)
        
        for(i in 1:length(allfiles)){
                poll_mon <- read.csv(paste(directory,"/",allfiles[i],sep=""))
                good <- complete.cases(poll_mon)
                santised_poll_mon <- poll_mon [good, ]
                if(nrow(santised_poll_mon)>threshold){
                        corrr <- c(corrr,cor(santised_poll_mon$nitrate,santised_poll_mon$sulfate))
                }
        }
        return(corrr)
        
        
}