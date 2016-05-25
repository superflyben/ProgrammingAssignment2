## The two functions below allow the computation, storage and retrieval of the
## inverse of an input matrix

#Function to create suite of functions that set or get a matrix and it's
#inverted counterpart. Data and functions are stored in this environment.
makeCacheMatrix <- function(mx = matrix()) {
    ivr <- NULL
    #Function to set or update makeCacheMatrix argument (default is empty), and
    #inverse of matrix (NULL until setinverse is run with non-NULL value)
    set <- function(new_mat) {
        mx <<- new_mat
        ivr <<- NULL
    }
    get <- function() mx
    #Function to set inverse of a matrix in parent environment
    setInverse <- function(new_ivr) ivr <<- new_ivr
    #Get inverse from parent environment
    getInverse <- function() ivr
    #Create list with names and functions for output
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


#Function to either calculate or retrieve the cached value of the inverse of a
#matrix. Input argument is the list of functions output by makeCacheMatrix.R,
#which also have access to the matrix of interest stored in the makeCacheMatrix
#environment
cacheSolve <- function(fcn_list, ...) {
    ivr <- fcn_list$getInverse()
    if(!is.null(ivr)) {
        #If this message is displayed, function is getting existing value
        message("getting cached data")
        print(ivr)
        return(ivr)
    }
    #If result does not already exist:
    #Get the data
    data <- fcn_list$get()

    #Caluclate the inverse (assumes matrix is square and invertible)
    ivr <- solve(data, ...)

    #Set inverse in the makeCacheMatrix environment
    fcn_list$setInverse(ivr)

    #Return result for this  function as well
    message("This is new data")
    print(ivr)
    ivr
}
