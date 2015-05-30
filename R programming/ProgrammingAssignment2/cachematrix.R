## These functions can be used to cache the potentially
## time-consuming computation of a matrix' inverse.
##
## The inverse gets stored together with the original 
## matrix in an retofitted list which can be constructed
## with the makeCacheMatrix function.
## The cacheSolve function first tries to look up the inverse
## in the cache, and if unsuccsessful, computes an stores it.

## The makeCacheMatrix function takes a matrix and returns a 
## special list containing functions to store/retrieve 
## the original matrix and functions to store/retrieve its
## inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)  
}


## The cacheSolve function takes a special matrix obtained through
## the makeCacheMatrix function and returns the cached inverse – if
## it is already cached. Otherwise it computes the inverse and stores
## it in the provided argument.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
        message("getting cached data")
        return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}