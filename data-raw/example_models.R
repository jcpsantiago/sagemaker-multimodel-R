# Code to generate the two models in `example_models` in the projects's root

data_df <- data.matrix(
  subset(mtcars, select = -c(am))
)
am_labels <- mtcars$am

generic <- xgboost::xgboost(
  data = data_df,
  label = am_labels,
  nrounds = 50,
  objective = "binary:logistic"
)

no_cyl <- xgboost::xgboost(
  data = subset(data_df, select = -c(cyl)),
  label = am_labels,
  nrounds = 50,
  objective = "binary:logistic"
)

xgboost::xgb.save(
  model = generic,
  fname = here::here("example_models/generic/model/model.xgb")
)

xgboost::xgb.save(
  model = no_cyl,
  fname = here::here("example_models/no_cyl/model/model.xgb")
)
