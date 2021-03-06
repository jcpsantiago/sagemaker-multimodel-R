% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_model.R
\name{load_model}
\alias{load_model}
\title{Load model}
\usage{
load_model(model_name, url, req, res)
}
\arguments{
\item{model_name}{Name of the model to load}

\item{url}{Path to model, example `/opt/ml/models/{model_name}/model`}

\item{req}{Request object}

\item{res}{Response object}
}
\value{
Assigns a variable in the global environment called `model_name`
}
\description{
Load model
}
