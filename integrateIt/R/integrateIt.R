#' Integrating a function
#'
#' Finds sum of trapezoids or area under parabolas under a curve.
#'
#' @param x A numeric object
#' @param y A numeric object with the same dimensionality as \code{x}.
#' @param rule A character string equal to either "Trap" or "Simpson"
#'
#' @return An object of class Squares containing
#'  \item{x}{The first object input}
#'  \item{y}{The second object input} 
#'  \item{area}{The summed area under the curve}
#' @author Tyler Brandt
#' @note The estimate will depend on which method of integration you choose.
#' @examples
#' 
#' myX <- c(1, 2) 
#' myY <- c(2, 4) 
#' integrateIt(myX, myY, "Trap")
#' @rdname integrateIt
#' @aliases integrateIt
#' @export
setGeneric(name = "integrateIt",
           def = function(x,y,rule,...){
             standardGeneric("integrateIt")
           })

#' @export
setMethod("integrateIt",
          definition = function(x, y, rule, ...){
            # ensure that x is a numeric
            if (class(x) != "numeric"){
              stop ("x must be a numeric vector")
            }
            # ensure that y is a numeric
            if (class(y) != "numeric"){
              stop ("y must be a numeric vector")
            }
            # ensure that x and y have the same length
            if (length(x) != length(y)){
              stop ("x and y must be of the same length")
            }
            # ensure that rule is either Trap or Simpson
            if (rule != "Trap" & rule != "Simpson"){
              stop ("rule must be either 'Trap' or 'Simpson'")
            }
            # ensure that the value of x are increasing
            for (i in 2:length(x)){
              if (x[i] < x[i-1]){
                stop("x must be an increasing set")
              }
            }
            # set up uniform length of intervals
            a <- min(x)
            b <- max(x)
            h <- (b-a)/(length(x)-1)
            x_sorted <- sort(x)
            # ensure uniform length of intervals
            for (i in 2:length(x)){
              if (x[i] - h != x[i-1]){
                stop ("must have uniform interval lengths in x")
              }
            }
            # Calculate Trapezoid area
            if (identical(rule, "Trap")){
              area_sum <- sum(2*y)-y[1]-y[length(y)]
              area <- h*area_sum/2
              return (new("trapezoid", x = x, y = y, area = area))
            } else if (identical(rule, "Simpson")){ # Calculate Simpson area
              if (h %% 2 == 0){
                stop ("x,y must be of odd length for integrateIt to work with rule 'Simpson' ")
              }
              area_sum <- 0
              for (i in 1:length(y)){
                if (i %% 2 == 0){
                  area_sum <- area_sum + 4*y[i]
                } else {
                  area_sum <- area_sum + 2*y[i]
                }
              }
              area_sum <- area_sum - y[1] - y[length(y)]
              area <- area_sum*h/3
              return (new("simpson", x = x, y = y, area = area))
            }
          })