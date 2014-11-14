complete <- function(directory,idvec=1:332) {
        df <- data.frame(id=integer(),nobs=integer())
        for (id in idvec) {
                filename <- paste("/Users/BossDawg/Desktop/",directory,"/", sprintf("%03d",as.integer(id)), ".csv", sep="")
        data <- read.csv(filename)
        nd <- data.frame(id=id, nobs=nrow(na.omit(data)))
        df <- rbind(df,nd)
        }
        df
}
