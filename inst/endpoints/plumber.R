library(plungrexample)

# TODO: function to automatically create the @param fields from the endpoint_functions definitions

#* @apiTitle Plumber Example API

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
plungrexample::ping

#* LOAD model
#* @serializer unboxedJSON
#* @post /models
plungrexample::load_model

#* DELETE model
#* @serializer unboxedJSON
#* @delete /models/<model_name>
plungrexample::delete_model

#* GET model
#* @serializer unboxedJSON
#* @get /models/<model_name>
plungrexample::get_model
