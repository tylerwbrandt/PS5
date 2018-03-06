context ("integrateIt inputs")

test_that ("x and y are numerics"){
  expect_error(integrateIt(c("h","k"),c(1,2),"Trap"))
  expect_error(integrateIt(c(1,2), c("h","k"),"Trap"))
}

test_that ("rule is either trapezoid or simpson"){
  expect_error(integrateIt(c(1,2), c(3,4), "riemann"))
}

test_that ("x and y are of the same length"){
  expect_error(integrateIt(c(1,2,3), c(4,5), "Trap"))
}

test_that ("x is increasing and intervals are of uniform length"){
  expect_error(integrateIt(c(2,1), c(3,4), "Trap"))
  expect_error(integrateIt(c(1,2,4), c(3,4,5), "Trap"))
}


