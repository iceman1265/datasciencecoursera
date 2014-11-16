pollutantmean <- function(directory, pollutant, id = 1:332) {
	##specifying the directory and arranging it that so all files called within the data set are recognized
    data = lapply(id, function(i) read.csv(paste("/Users/BossDawg/Desktop/",directory,"/",formatC(i, 
        width = 3, flag = "0"), ".csv", sep = ""))[[pollutant]])
    	##removing na's from the data set and return the mean of the selected files
    return(mean(unlist(data), na.rm = TRUE))
}