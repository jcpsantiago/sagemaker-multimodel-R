#' Information from loaded model
#'
#' @param model_name Name of the model
#' @param req Request object
#' @param res Response object
#'
#' @return Gets information from a loaded model
#' @export
get_model <- function(model_name, req, res) {
  if (!model_name %in% .sage$loaded_models$modelName) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }

  response <- list(
    modelName = .sage$loaded_models$modelName,
    modelUrl = .sage$loaded_models$modelUrl
  )

  return(response)
}
