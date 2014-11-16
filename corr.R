corr <- function(directory, threshold = 0) {
    corrsNum <- numeric(0)

    ## get a data frame as ID = 1:332
    nobsDfr <- complete("specdata")
    ##apply threshold
    nobsDfr <- nobsDfr[nobsDfr$nobs > threshold, ]

    for (cid in nobsDfr$id) {
        # --- Assert get a data frame as ID in $id
        monDfr <- getmonitor(cid, directory)

        # --- Assert calculate correlation between $sulfate and $nitrate
        corrsNum <- c(corrsNum, cor(monDfr$sulfate, monDfr$nitrate, use = "pairwise.complete.obs"))
    }

    # --- Assert return value is a numeric vector of correlations
    return(corrsNum)
}

complete <- function(directory, id = 1:332) {
    ## Assert create an empty vector
    nobsNum <- numeric(0)

    for (cid in id) {
        # --- Assert get data frame as ID
        cDfr <- getmonitor(cid, directory)

        # --- Assert count the number of complete cases and append to numeric
        # vector
        nobsNum <- c(nobsNum, nrow(na.omit(cDfr)))
    }

    # --- Assert return value is a data frame with TWO (2) columns
    data.frame(id = id, nobs = nobsNum)
}

getmonitor <- function(id, directory, summarize = FALSE) {
    # --- Assert construct file name Directory is pre-appended to file name.
    # Use sprintf() to add leading zeroes.  E.g. 'specdata/001.csv'
    fileStr <- paste("/Users/BossDawg/Desktop/",directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
        sep = "")

    # --- Assert read csv
    rawDfr <- read.csv(fileStr)

    # --- Assert summary if true
    if (summarize) {
        print(summary(rawDfr))
    }

    # --- Return value is a data frame
    return(rawDfr)
}

