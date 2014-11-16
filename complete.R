complete <- function(directory,idvec=1:332) {
	##specifying the way in which the data will be called and formating it into integers, both the id's and the data itself
        df <- data.frame(id=integer(),nobs=integer())
        ##a loop function running the newly created id variable across the called idvec from the function
        for (id in idvec) {
        	##pointing R at the directory which in this case is the one found on my Desktop
                filename <- paste("/Users/BossDawg/Desktop/",directory,"/", sprintf("%03d",as.integer(id)), ".csv", sep="")
                ##converting the files into a table and storing it in a new variabe called data
        data <- read.csv(filename)
        ## converting the variable data into a new variable, nd and organizing it so all NA's are removed from the rows of data
        nd <- data.frame(id=id, nobs=nrow(na.omit(data)))
        df <- rbind(df,nd)
        }
        df
}
