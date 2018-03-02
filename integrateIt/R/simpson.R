#' A simpson object
#' 
#' Object of class \code{simpson} are created by the \code{integrateIt} function
#' 
#' 
#' An object of class 'simpson' has the following slots:
#' \itemize{
#' \item \code{x} the x values
#' \item \code{y} the evaluated f(x) values
#' \item \code{area} estimated area under the curve
#' }
#' 
#' @author Tyler Brandt: \email{brandttyler@wustl.edu}
#' @aliases simpson-class initialize
#' @rdname simpson
#' @export
setClass(Class = "simpson",
         representation = representation(
           x = "numeric",
           y = "numeric",
           area = "numeric"
         ),
         prototype = prototype(
           x = c(),
           y = c(),
           area = c()
         ))

#' @export
setMethod("initialize", "simpson",
          function(.Object, ...){
            value = callNextMethod()
            return (value)
          })

