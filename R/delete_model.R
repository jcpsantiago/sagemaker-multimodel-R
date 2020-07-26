#' Unload loaded model
#' 
#' @param model_name Name of the model
#' @param req Request object
#' @param res Response object
#'
#' @return Unloads a loaded model
#' @export
delete_model <- function(model_name, req, res) {
  if (!model_name %in% loaded_models$modelName) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }

  message("Unloading model `", model_name, "`")
  loaded_models <<- loaded_models[!loaded_models$modelName == model_name, , drop = FALSE]
  rm(list = eval(model_name), envir = globalenv())

  return("")
}
