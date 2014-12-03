makeVector <- function(x= numeric()) {
	m <- NULL
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setmean <- function(mean) m <<- mean
	getmean <- function() m
	list(set=set,get=get,
		setmean=setmean,
		getmean=getmean)
}

cachemean <- function(x, ...) {
	m <- x$getmean()
	if(!is.null(m)) {
		message("getting cached data")
		return(m)
	}
	data <- x$get()
	m <- mean(data, ...)
	x$setmean(m)
	m
}

makeCacheMatrix <- function(x=matrix()) {
	elc <- NULL
	set <- function(y) {
		x <<- y
		elc <<- NULL
	}
	get <- function() x
	setreverse <- function(reverse) elc <<- reverse
	getreverse <- function() elc
	list(set=set, get=get,
		setreverse=setreverse,
		getreverse=getreverse)
}