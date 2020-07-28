# needed for Sagemaker compliance when more than 1 container is used in series
sagemaker_port <- if (Sys.getenv("SAGEMAKER_BIND_TO_PORT") != "") {
  as.integer(Sys.getenv("SAGEMAKER_BIND_TO_PORT"))
} else {
  8080
}

args <- commandArgs()
if (any(grepl("serve", args))) {
  message("Starting sagemakerMultiModelR ", packageVersion("sagemakerMultiModelR"))
  sagemakerMultiModelR::run_api(.port = sagemaker_port)
}
