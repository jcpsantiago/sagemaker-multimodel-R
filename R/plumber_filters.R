#' Add original model name to req
#'
#' @description Filter to add the name of the model as seen by AWS to the request. This is useful for logging purposes.
#' @param req plumber request environment
#' @param res plumber response environment
#'
#' @export
add_original_model_name <- function(req, res) {
  original_model_name <- gsub(
    pattern = "\\.tar\\.gz",
    replacement = "",
    x = req$HTTP_X_AMZN_SAGEMAKER_TARGET_MODEL
  )
  
  req$original_model_name <- original_model_name
  
  plumber::forward()
}
