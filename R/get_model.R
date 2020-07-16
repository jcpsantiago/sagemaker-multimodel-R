#' Title
#'
#' @param model_name
#' @param req 
#' @param res 
#'
#' @return Gets a loaded model information
#' @export
get_model <- function(model_name, req, res) {
  if (!model_name %in% loaded_models) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }
  
  response <- list(
    modelName = model_name,
    # FIXME get actual path :p
    modelUrl = "/opt/ml/models/{model_name}/model"
  )
  
  return(response)
}
