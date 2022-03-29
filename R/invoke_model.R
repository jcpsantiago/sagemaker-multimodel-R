#' Invoke model
#'
#' @param model_name Name of the model
#' @param data_for_inference The data needed for the model
#' @param req Request object
#' @param res Response object
#'
#' @return A prediction from `model_name`.
#' @export
invoke_model <- function(model_name, data_for_inference, req, res) {
  if (!model_name %in% .sage$loaded_models$modelName) {
    message("Model `", model_name, "` is not loaded!")
    res$status <- 404
    return("")
  }

  # XGBoost needs a matrix
  data_matrix <- data.matrix(data_for_inference)

  message("Predicting using model `", model_name, "`")
  prediction <- paste(
    stats::predict(
      eval(parse(text = paste0("`", model_name, "`"))),
      data_matrix,
      row.names = FALSE
    )
  )
  
  model_info <- subset(.sage$loaded_models, modelName == model_name)
  
  threshold <- as.double(model_info$threshold)
  predicted_class <- ifelse(
    predicted_score > threshold,
    "fraud",
    "good"
  )

  predicted_score <- signif(predicted_score, 5)
  
  message(
    "Model `", req$original_model_name,
    "` (", model_name, ") predicted score for ", invoice_uuid, ": ", predicted_score,
    " (", predicted_class, ")"
  )
  
  response <- list(
    model_name = model_name,
    score = predicted_score
  )
  return(response)
}
