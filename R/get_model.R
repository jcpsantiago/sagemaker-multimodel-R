#' Title
#'
#' @param model_name
#' @param req
#' @param res
#'
#' @return Gets a loaded model information
#' @export
get_model <- function(model_name, req, res) {
  if (!model_name %in% loaded_models$modelName) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }

  response <- list(
    modelName = loaded_models$modelName,
    modelUrl = loaded_models$modelUrl
  )

  return(response)
}
