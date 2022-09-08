# local_api_gw_lambda

## Starting LocalStack

Start LocalStack in detached mode (-d)

`localstack start -d`

## Testing that it work

```shell
# Provision the API gateway and Lambda function with Terraform
terraform init
terraform plan
terraform apply

# Verify that the API gateway is created in LocalStack
aws --region=ap-southeast-1 --endpoint-url=http://localhost:4566 apigateway get-rest-apis
# Verify that the Lambda function is created in LocalStack
aws --region=ap-southeast-1 --endpoint-url=http://localhost:4566 lambda list-functions

# Try making a request to an API endpoint served by the API gateway
curl http://localhost:4566/restapis/<api_gw_rest_api_id>/<stage>/_user_request_/<api_path>
# Eg. curl http://localhost:4566/restapis/3me41x9p3d/test/_user_request_/api
# Output
{"message":"Hello from Lambda"}%
```

### Cleanup

```shell
terraform destroy
```
