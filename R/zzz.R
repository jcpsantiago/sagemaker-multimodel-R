.onLoad <- function(libname, pkgname) {
  .sage <- new.env()
  
  # Needed for keeping track of models loaded
  .sage$loaded_models <- data.frame(
    modelName = character(),
    modelUrl  = character()
  )
}
