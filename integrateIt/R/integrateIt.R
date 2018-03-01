#' Integrating a function
#'
#' Finds sum of trapezoids or area under parabolas under a curve.
#'
#' @param x A numeric object
#' @param y A numeric object with the same dimensionality as \code{x}.
#' @param rule A string equal to either "Trap" or "Simpson"
#'
#' @return An object of class Squares containing
#'  \item{x}{The first object input}
#'  \item{y}{The second object input} 
#'  \item{area}{The summed area under the curve}
#' @author Tyler Brandt
#' @note The estimate will depend on which method of integration you choose.
#' @examples
#' 
#' myX <- c(20, 3) 
#' myY <- c(-2, 4.1) 
#' integrateIt(myX, myY)
#' @rdname integrateIt
#' @aliases integrateIt
#' @export
