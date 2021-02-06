#' Load model
#'
#' @param model_name Name of the model to load
#' @param url Path to model, example `/opt/ml/models/{model_name}/model`
#' @param req Request object
#' @param res Response object
#'
#' @return Assigns a variable in the global environment called `model_name`
#' @export
load_model <- function(model_name, url, req, res) {
  if (model_name %in% .sage$loaded_models$modelName) {
    message("Model `", model_name, "` is already loaded!")
    res$status <- 409
    return("")
  }

  message("Trying to load model `", model_name, "` from `", url, "`")

  xgb_model <- tryCatch(
    {
      # .tar.gz files unpack into `/opt/ml/models/<model_name>/model/`
      xgb <- xgboost::xgb.load(paste0(url, "/model.xgb"))
    },
    error = function(e) {
      message("Model `", model_name, "` couldn't be loaded!")
      res$status <- 507
      print(e)
      return("")
    },
    finally = function(xgb) {
      message("Model `", model_name, "` is loaded.")
    }
  )

  if (res$status != 200) {
    return("")
  }

  message("Adding `", model_name, "` with url `", url, "` to list of loaded models")
  new_model <- data.frame(
    modelName = model_name,
    modelUrl = url
  )

  # loaded_models lives in the .sage env, see zzz.R
  .sage$loaded_models <- rbind(.sage$loaded_models, new_model)
  assign(model_name, xgb_model, envir = .sage)

  return("")
}
