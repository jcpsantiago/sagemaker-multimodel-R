#' Single model endpoint
#'
#' @param raw_data Unprocessed data
#' @param req Request object
#' @param res Response object
#'
#' @return Gets information from a loaded model
#' @export
preprocess <- function(raw_data, req, res) {
  response <- list(
    data_for_inference = raw_data
  )

  return(response)
}
