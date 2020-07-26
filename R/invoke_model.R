#' Title
#'
#' @param model_name Name of the model
#' @param data_for_inference The data needed for the model
#' @param req Request object
#' @param res Response object
#'
#' @return A prediction from `model_name`.
#' @export
invoke_model <- function(model_name, data_for_inference, req, res) {
  if (!model_name %in% loaded_models$modelName) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }

  # XGBoost needs a matrix
  data_matrix <- data.matrix(data_for_inference)

  message("Predicting using model `", model_name, "`")
  prediction <- paste(
    stats::predict(eval(parse(text = model_name)), data_matrix, row.names = FALSE)
  )

  message("Model `", model_name, "` predicted score: ", prediction)
  response <- list(
    model_name = model_name,
    score = prediction
  )
  return(response)
}
