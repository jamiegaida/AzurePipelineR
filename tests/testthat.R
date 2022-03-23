library(testthat)
library(AzurePipelineR)

if (.Platform$OS.type == "unix" &&
    !interactive()) {
  test_check("AzurePipelineR",
             reporter = MultiReporter$new(reporters = list(
               JunitReporter$new(file = "test-results.xml"),
               CheckReporter$new()
             )))
} else {
  test_check("AzurePipelineR")
}
