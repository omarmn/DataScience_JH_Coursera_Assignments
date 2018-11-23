## Put comments here that give an overall description of what your
## functions do

## This function will store a matrix using the "<<-" operator
## to assign matrix to the variable "m" in the Global environment
## which will enable to be called called from functions within
## the global environment

makeCacheMatrix <- function(x = matrix()) {
        
        m <<- x
}


## This function calculates the inverse of a matrix.
## It will check first if a matrix has been cached. If there's
## no cahced matrix (or rather a NULL matrix), then this function
## will call the aforementioned function and cache it in the 
## Global Environment. If there's a cached matrix, the cached matrix
## will be used and return the inverse of the matrix. This will fail
## if a matrix has not been cached AND it's defined as NULL.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        if (is.null(m)) {
                makeCacheMatrix(x)
        } 
        else {
                print("getting cached data")
        }  
        solve(m)
        
 
}
