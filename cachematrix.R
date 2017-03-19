## Put comments here that give an overall description of what your
## functions do

## The pair of functions below help in craeting a matrix and in computing its inverse. 
## If the inverse is already computed, the cached value is reurned. This saves computational cycles.

## Write a short comment describing this function

## This function creates a special matrix object that can cache it's inverse.

makeCacheMatrix <- function(x = matrix()) {
  myinv <- NULL
  set <- function(y) {
    x <<- y
    myinv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) myinv <<- inverse
  getinverse <- function() myinv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## Write a short comment describing this function

## This function conputes the inverse of the matrix created by the makeCacheMatrix function above. 
## If the inverse has been already computed once and the matrix hasn;t changed, 
## the inverse is returned from the cached value.
          
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  myinv <- x$getinverse()
  if(!is.null(myinv)) {
    message("getting cached data")
    return(myinv)
  }
  mat <- x$get()
  myinv <- solve(mat, ...)
  x$setinverse(myinv)
  myinv
}
