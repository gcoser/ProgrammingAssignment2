# Caching Inverse of a Matri#Functions to create a special matrix object

# This function makeCacheMatrix creates a special "matrix" object that can cache its inverse.


# Example usage

makeCacheMatrix <- function(x = matrix()) {
  invx <- NULL
  
  # the values of the special vector is set.
  set <- function(y) {
    x <<- y
    invx <<- NULL
  }


  ## get-set
  
  get <- function() x
  set <- function(y) {
    x <<- y
    invx <<- NULL
  }
  
  ## getter/setter for matrix inverse
  getinv <- function() invx
  setinv <- function(inverse) invx <<- inverse
  
  ## return list of functions for matrix
  list(set=set, get=get,
       setinv=setinv,
       getinv=getinv)
}

# Computes the inverse of a matrix.

#   The inverse of the matrix
cacheSolve <- function(x, ...) {
  invx <- x$getinv()
  
  # return cached matrix inverse if it's been already computed
  if (!is.null(inv)) {
    message("Getting cached data")
    return(invx)
  }
  
  # compute inverse of matrix 
  data <- x$get()
  invx <- solve(data, ...)
  
  # cache inverse
  x$setinv(invx)
  
 invx
 
}
