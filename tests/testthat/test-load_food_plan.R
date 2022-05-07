test_that("Test: load_food_plan", {
  
  out <- load_food_plan()
  
  expect_equal(class(out)[1], "tbl_df")
  
})
