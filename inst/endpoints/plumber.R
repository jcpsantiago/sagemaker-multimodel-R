library(sagemakerMultiModelR)

#* @apiTitle Sagemaker Multi-Model API
#* @apiDescription This API follows the Sagemaker contract for multiple models found in https://docs.aws.amazon.com/sagemaker/latest/dg/mms-container-apis.html

#* Healthcheck
#* @get /ping
sagemakerMultiModelR::ping

#* LOAD model
#* @serializer unboxedJSON
#* @post /models
sagemakerMultiModelR::load_model

#* LIST model
#* @serializer unboxedJSON
#* @get /models
sagemakerMultiModelR::list_model

#* GET model
#* @serializer unboxedJSON
#* @get /models/<model_name>
sagemakerMultiModelR::get_model

#* UNLOAD model
#* @serializer unboxedJSON
#* @delete /models/<model_name>
sagemakerMultiModelR::delete_model

#* INVOKE model
#* @serializer unboxedJSON
#* @post /models/<model_name>/invoke
sagemakerMultiModelR::invoke_model
