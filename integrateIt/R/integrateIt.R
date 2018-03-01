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
          function(x, y, rule, ...){
            a <- min(x)
            b <- max(x)
            h <- (b-a)/length(x)
            x_sorted <- sort(x)
            if (identical(rule, "Trap")){
              area_sum <- sum(2*y)-a-b
              area <- h*area_sum/2
              return (new("trapezoid", x = x, y = y, area = area))
            } else if (identical(rule, "Simpson")){
              if (h %% 2 == 0){
                return ("Error: x,y must be of odd length for integrateIt to work with rule 'Simpson' ")
              }
              area_sum <- 0
              for (i in 1:length(y)){
                if (i %% 2 == 0){
                  area_sum <- area_sum + 4*y[i]
                } else {
                  area_sum <- area_sum + 2*y[i]
                }
              }
              area_sum <- area_sum - a - b
              area <- area_sum*h/3
              return (new("simpson", x = x, y = y, area = area))
            }
          })