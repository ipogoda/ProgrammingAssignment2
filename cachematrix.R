## First of all I'm tottally new to this programming stuf, so please, please be latient. 
## Second is, that I'm actualy suprised that it works :) this course is hard for me.
##(And this Git stuff is so bad - so if this doesn't work, it's really git fault!)
## So, as You can see, below is set of two functions. First one is to set 
## value of inverted matrix and the second one is to retrieve it form cache. The goal for it
## (isn't it always good to know what "the autor had in mind"?) is to make computations that
## utilize inverted matrix go smoother, faster and more efficient. 

## 1. To create this "super-special" matrix in an enviroment
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  #To set value of the matrix
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  #To get the value of the matrix
  get <- function() {x}
  #To set the value of the solve
  setsolve <- function(solve) {inv <<- solve}
  #To get the value of the solve
  getsolve <- function() {inv}
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## 2. To cache value of this "super-special" inverted matrix
cacheSolve <- function(x, ...) {
  inv <- x$getsolve()
  #What the heck, lets check! (if it was already done)
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
        ## Return a matrix that is the inverse of 'x'
  data <- x$get()
  inv <- solve(data, ...)
  x$setsolve(inv)
  inv
  }
