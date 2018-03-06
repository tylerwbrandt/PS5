context ("integrateIt inputs")

test_that ("x and y are numerics", {
  expect_error(integrateIt(c("h","k"),c(1,2),"Trap"))
  expect_error(integrateIt(c(1,2), c("h","k"),"Trap"))
})

test_that ("rule is either trapezoid or simpson", {
  expect_error(integrateIt(c(1,2), c(3,4), "riemann"))
})

test_that ("x and y are of the same length", {
  expect_error(integrateIt(c(1,2,3), c(4,5), "Trap"))
})

test_that ("x is increasing and intervals are of uniform length"){
  expect_error(integrateIt(c(2,1), c(3,4), "Trap"))
  expect_error(integrateIt(c(1,2,4), c(3,4,5), "Trap"))
}

context("make sure it integrates properly")

test_that("trapezoid rule works properly", {
  expect_equal(integrateIt(c(1,2,3),c(4,5,6),"Trap"), 10)
})

test_that("simpson rule works properly", {
  expect_equal(integrateIt(c(1,2,3),c(4,5,6),"Simpson"), 10)
})

context("simpson particulars")

test_that("simpson requires odd length", {
  expect_error(integrateIt(c(1,2,3,4),c(5,6,7,8),"Simpson"))
})