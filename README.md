# AzurePipelineR
## Motivation
Make it easy to use Azure DevOps Pipelines to check, test, and lint R packages by providing a 'drop in' yaml file and simple instructions.

## Typical usage
Pull requests are set up to trigger a pipeline run. The pipeline lints the code using [MegaLinter](https://github.com/megalinter/megalinter) and [lintr](https://github.com/r-lib/lintr), and checks the package using [rcmdcheck::rcmdcheck()](https://r-pkgs.org/r-cmd-check.html#check-checks). Unit tests are run with [testthat](https://r-pkgs.org/tests.html) during `rcmdcheck`. Code coverage is evaluated by [covr::azure()](https://covr.r-lib.org/reference/azure.html)

## Reporting
Linting, checking, testing, and code coverage results are available for review on the Azure pipeline.

## Details
The files `azure-pipelines.yml` and `/tests/testthat` are the core of this repository. The actual package contains only one toy  function `hello()`.

## Set-up
1. Ensure Azure build minutes are [activated](https://devblogs.microsoft.com/devops/change-in-azure-pipelines-grant-for-private-projects/)
1. Add `azure-pipelines.yml` file to root of your repository on Azure DevOps.
2. Add `/tests/testthat` to your project substituting occurrences of the text `AzurePipelineR` with your package name. This outputs test results in JUnit format to the file `test-results.xml` when run on linux in non-interactive mode.
1. Set up new pipeline
    1. Pipelines > Pipelines > New Pipeline > Azure Repos Git > mypackage > Existing Azure Pipelines YAML file > Path >  azure-pipelines.yml
1. Run pipeline
1. Set up branch policies to run pipeline for pull requests using these [instructions](https://docs.microsoft.com/en-us/azure/devops/repos/git/branch-policies?view=azure-devops&tabs=browser#build-validation)

## Acknowledgement
This pipeline was pieced together from numerous sources that are gratefully acknowledged.

- https://stackoverflow.com/questions/60045425/how-to-make-azure-pipeline-yml-for-ci-for-a-r-package
- https://community.rstudio.com/t/creating-an-azure-pipelines-yml-for-azure-devops-testing-packages-shiny-scripts/32471/2
- https://adinermie.com/publishing-github-super-linter-terraform-quality-checks-to-azure-devops-pipelines/
- https://github.com/r-lib/r-azure-pipelines
- https://github.com/r-lib/r-azure-pipelines/blob/master/tests/testthat.R
- https://github.com/megalinter/megalinter/issues/538#issuecomment-885602936
