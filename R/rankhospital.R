#This function ranks hospitals based on survey data for various states. Users 
#can select heart attack, heart failure, or pneumonia. THe function will locate the corresponding 
#hospital based on the users ranking input

rankhospital <- function(state, outcome, num = "best") {
        full_data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
        
        #assigning the columns to the various user inputs, such as heart attack, heart failure and pneumonia
        column <- if (outcome == "heart attack") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        } else if (outcome == "heart failure") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        } else if (outcome == "pneumonia") {
                "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        } else {
                stop("invalid outcome")
        }
        
        data_for_state <- full_data[full_data$State == state, c("Hospital.Name", column)]
        
        if (nrow(data_for_state) == 0) {
                stop("invalid state")	
        }
        
        data_for_state[,2] <- as.numeric(data_for_state[,2])
        ordered_data_for_state <- order(data_for_state[column], data_for_state$Hospital.Name, na.last=NA)
        
        if (num == "best") {
                as.character(data_for_state$Hospital.Name[ordered_data_for_state[1]])
        } else if (num == "worst") {
                as.character(data_for_state$Hospital.Name[ordered_data_for_state[length(ordered_data_for_state)]])
        } else if (is.numeric(num)) {
                as.character(data_for_state$Hospital.Name[ordered_data_for_state[num]])
        } else {
                stop("invalid num")
        }
}
