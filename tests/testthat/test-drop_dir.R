test_that("Test: drop_dir", {
  
  token <- readRDS("dev/token.RDS")
  
  out <- catch_error(
    rdrop2::drop_dir(dtoken = token, limit = 1)
  )
  
  if (!is.null(out$error)) {
    token$refresh()
  }
  
  out <- rdrop2::drop_dir(dtoken = token)
  
  expect_equal(class(out)[1], "tbl_df")
  
})
