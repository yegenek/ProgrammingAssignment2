## These two functions together takes an input matrix and returns the inverse of the matrix. 
## 

## This function catches the input matrix to enable the next function to check and inverse it. And also creates a list containing four functions beforehand.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}




## This function checks if the matrix is already inversed. If so it gets the inverse from cache and skips calculation.
## If the inverse is not solved i.e. m is null it takes the inverse of matrix and stores it in "inv" parameter

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data.")
    return(m)
  }
  data1 <- x$get()
  inv <- solve(data1)
  x$setinverse(m)
  inv
}

#The three lines below are to check if the functions work.
ex1 <- matrix(data = c(1:4), nrow = 2, ncol = 2)
ex2 <- makeCacheMatrix(mat)
cacheSolve(ex2)
