## the functions below cache the inverse of a matrix by first creating a matrix that can cache its inverse

## this function creates a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        s<- NULL
        set<- function(y) {
                x<<- y
                s<<- NULL
        }
        get<- function() x
        tosolve<- function(solve) s<<- solve
        getsolve<- function() s
        list(set = set, get = get, getsolve = getsolve, tosolve = tosolve)
}


## this function returns the inverse of the matrix created by the funciton above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s<- x$getsolve()
        if(!is.null(s)) {
                message("inverse matrix")
                return(s)
        }
        data<- x$get()
        s<- solve(data, ...)
        x$setsolve(s)
        s
}