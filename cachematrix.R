# Create method to allow an inversion calculation to cache the value of a
# caulcation for reuse 

   # Create a matrix function to set and get values of a matrix
   makeCacheMatrix <- function(x = matrix()) {
   # create a placeholder to store the calulated matrix values in 
   # and initiate with no value
        m<- NULL
        # define a function to set the value of the matrix to a new value
        set<- function(y){
        x <<- y
      m <<- NULL
        }
        
    get <- function() x
    setsolve <- function(solve) m<<-solve
    getsolve <- function() m
    # create special vector containing the functions defined above
    list(set=set, get=get, setsolve=setsolve, getsolve=getsolve)
        
}


#solve a matrix value, using either the cached value or creating a new value
# if there is no value in the cache 
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<- x$getsolve()
        if(!is.null(m)){
                message("retrieving cached data")
                return(m)
        }
        matrixdata <- x$get()
        m<- solve(matrixdata, ...)
        x$setsolve(m)
        m
}


