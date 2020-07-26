message("Starting sagemakerMultiModelR ", packageVersion("sagemakerMultiModelR"))

# Needed for keeping track of models loaded
loaded_models <- data.frame(
  modelName = character(),
  modelUrl  = character()
)

sagemakerMultiModelR::run_api()
