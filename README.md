<!-- badges: start -->
[![R build status](https://github.com/jcpsantiago/sagemaker-multimodel-R/workflows/R-CMD-check/badge.svg)](https://github.com/jcpsantiago/sagemaker-multimodel-R/actions)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

# Sagemaker Multi-Model Server for R
 
[Sagemaker](https://aws.amazon.com/sagemaker/) is AWS's machine learning product.
It is mostly targeted at Python users, but it's possible to deploy and train models using any language via docker containers.

This package is an implementation of the [API contract for handling multiple models](https://docs.aws.amazon.com/sagemaker/latest/dg/mms-container-apis.html) in the same Sagemaker Endpoint.
It uses Plumber and a dummy XGBoost model.

Everything is a WORK IN PROGRESS and subject to change! 

## Why would you use this?

Use this implementation of the Multi-Model server if you want to use Sagemaker and:

* your pipeline (training/feature eng) is in R and you want to keep it that way
* serve multiple models in one instance to save costs
* want to use a different version or a model not available from AWS

## See also
* [tmastny/sagemaker](https://github.com/tmastny/sagemaker) -- a simplified interface to the AWS Sagemaker API.
