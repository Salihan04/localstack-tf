output "api_gw_rest_api_id" {
  value = aws_api_gateway_rest_api.api_gw.id
}

output "api_gw_stage" {
  value = aws_api_gateway_deployment.deployment.stage_name
}