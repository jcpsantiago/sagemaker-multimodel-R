#' Title
#'
#' @param model_name Name of the model
#' @param url Path to model, example `/opt/ml/models/{model_name}/model`
#' @param req Request object
#' @param res Response object
#'
#' @return Assigns a variable in the global environment called `model_name`
#' @export
#'
#' @examples
load_model <- function(model_name, url, req, res) {
  if (model_name %in% loaded_models) {
    message("Model `", model_name, "` is already loaded!")
    res$status <- 409
    return("")
  }
  
  xgb_model <- tryCatch(
    {
      xgb <- xgboost::xgb.load(url)
    },
    error = function(e) {
      message("Model `", model_name, "` couldn't be loaded!")
      res$status <- 507
      print(e)
      return("")
    },
    finally = function(xgb) {
      print(class(xgb))
    }
  )

  message("Adding `", model_name, "` to list of loaded models")
  loaded_models <<- c(loaded_models, model_name)
  assign(model_name, xgb_model, envir = globalenv())
  
  return("")
}
