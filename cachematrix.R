## Two functions used to create a special object thatis a matrix and cache 
## its inverse.

## The function creates a vector that is a list containing
## a function to set value of matrix, get value of matrix, set value of the 
## inverse and get value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  get <- function() x
  setinv <- function(solve) m <<- solve
  getinv <- function() m
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
         
        
        
}

## This function calculates the inverseof the matrix. Checks if the inverse is
## in the cache then uses it otherwise calculates it and sets the value.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
           
  m<-x$getinv()
  if(!is.null(m)){
    message("getting cached data")
    return(m)
  }
  matrix<-x$get()
  m<-solve(matrix, ...)
  x$setinv(m)
  m
  

}
        
        
