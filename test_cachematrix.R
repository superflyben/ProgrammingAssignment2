#Source functions----
source('cachematrix.R')

#Set up the problem----
#Create data
myData = sample(1:100,25)

#Generate square invertible matrix
myMat <- matrix(myData, nrow = 5, ncol = 5)

#Store matrix in the makeCacheMatrix environment for access by functions that
#are also created by makeCacheMatrix. Store these in fwd (abbreviation for
#functions with data).
fwd <- makeCacheMatrix(myMat)

#Calculate the result----
#Either calulate the inverse of the matrix stored in makeCacheMatrix environment
#or get the cached value if cacheSolve has already been run once.
#Should be new result
cacheSolve(fwd)
#Should be cached result
cacheSolve(fwd)

#Update data and re-run----
fwd$set(matrix(sample(1:100,25), nrow = 5, ncol = 5))
#Should be new result
cacheSolve(fwd)
#Should be cached result
cacheSolve(fwd)