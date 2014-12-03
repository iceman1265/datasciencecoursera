#rankall is a funciton that reads through a csv file that is full of hospital survey data. This function 
#reads through the csv file and ranks all hospitals within the csv file for three variables. Those
#variables are "heart attack", "heart failure", and "pneumonia"
#User can input Best or Worst and the appropriate output will occur. 
rankall <- function(outcome, num = "best") {
        #reading in the data file which in this case is outcome-of-care-measures.csv
        data <- read.csv(file="outcome-of-care-measures.csv", colClasses = 'character')
        #assigning the column value to the user input value, heart attack
        if(outcome == 'heart attack') {
                i <- 11
        }
        #assigning the column value of heart failure to the possible user input value for the function
        else if(outcome == 'heart failure') {
                i <- 17
        }
        #assigning the column value for pneumonia to the possible user input for the funciton
        else if(outcome == 'pneumonia') {
                i <- 23
        }
        #error check, if user doesn't input valid command, produce error
        else {
                stop('invalid outcome')
        }
        
        unique.states <- sort(unique(data$State))
        # print(unique.states)
        
        result.df <- list()
        #loop through states and ranking states
        for(state in unique.states) {
                data.state <- data[data$State == state, ]
                data.state[, i] <- as.numeric(x=data.state[, i])
                data.state <- data.state[complete.cases(data.state), ]
                
                # print(num)
                #assigning the variable best to the number 1 value
                if(num == "best") {
                        numrank = 1
                }
                #assigning variable worst to the lowest value
                else if(num == "worst") {
                        numrank = nrow(data.state)
                        
                }
                else if(is.numeric(x=num)) {
                        # print(num)
                        if(num < 1 || num > nrow(data.state)) {
                                result.df <- rbind(result.df, list(NA, state))
                                print(state)
                                next
                        }
                        else numrank <- num
                        # print(num)
                }
                else {
                        stop('invalid num')
                }
                
                # print(num)
                data.state <- data.state[order(data.state[,i], data.state$Hospital.Name), ]
      
                return.names <- data.state[numrank, ]$Hospital.Name
                
                # print(return.names[1])
                
                result.df <- rbind(result.df, list(return.names[1], state))
                # print(result.df)
        }
        
        result.df <- as.data.frame(x=result.df)
        colnames(x=result.df) <- c('hospital', 'state')
        #producing the results 
        result.df
}