best <- function(state, outcome){
        data <- read.csv(file='outcome-of-care-measures.csv', colClasses = 'character')
        
        if(!any(state == data$State)) {
                stop('invalid state')
        }
        if(outcome == 'heart attack') {
                i <- 11
        }
        else if(outcome == 'heart failure'){
                i <- 17
        }
        else if(outcome == 'pneumonia'){
                i <- 23
        }
        else{
                stop('invalid outcome')
        }
        data.state <- data[data$State == state, ]
        data.state[, i] <- as.numeric(x=data.state[, i])
        
        data.state <- data.state[complete.cases(data.state), ]
        
        return.names <- data.state[(data.state[, i] == min(data.state[, i])), ]$Hospital.Name
        
        sort(return.names)[1]
}