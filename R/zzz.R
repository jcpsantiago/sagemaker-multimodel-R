.onLoad <- function(libname, pkgname) {
  # Needed for keeping track of models loaded
  message("Loading `loaded_models` into Global Environment.")
  loaded_models <<- data.frame(
    modelName = character(),
    modelUrl  = character()
  )
}
