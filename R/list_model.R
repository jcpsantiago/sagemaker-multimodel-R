#' List currently loaded models
#'
#' @param req Request object
#' @param res Response object
#'
#' @return List of loaded models tracked in `loaded_models`
#' @export
list_model <- function(req, res) {
  message("Returning currently loaded models...")

  currently_loaded_models <- list(
    models = loaded_models
  )

  return(currently_loaded_models)
}
