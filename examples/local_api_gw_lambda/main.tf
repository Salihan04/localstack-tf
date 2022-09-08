# tfsec:ignore:aws-api-gateway-no-public-access
module "api_gw_lambda" {
  source = "../../modules/api_gw_lambda"

  source_file   = "${path.module}/index.js"
  output_path   = "${path.module}/index.zip"
  function_name = "localstack_lambda"
  handler       = "index.handler"
  runtime       = "nodejs14.x"

  api_gw_name               = "localstack_api_gw"
  api_gw_proxy_path_part    = "api"
  api_gw_proxy_method       = "ANY"
  api_gw_proxy_auth         = "NONE"
  api_gw_integration_method = "POST"
  api_gw_integration_type   = "AWS_PROXY"
  api_gw_stage              = "test"
}