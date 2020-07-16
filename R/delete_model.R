#' Title
#'
#' @param req 
#' @param res 
#'
#' @return Unloads a loaded model
#' @export
delete_model <- function(model_name, req, res) {
  browser()
  if (!model_name %in% loaded_models) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }
  
  message("Deleting model `", model_name, "`")
  loaded_models <<- loaded_models[!loaded_models == model_name]
  rm(list = eval(model_name), envir = globalenv())
  
  return("")
}
