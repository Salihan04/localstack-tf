provider "aws" {

  access_key = "test"
  secret_key = "test"
  region     = "ap-southeast-1"

  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3         = "http://s3.localhost.localstack.cloud:4566"
    apigateway = "http://0.0.0.0:4566"
    iam        = "http://0.0.0.0:4566"
    lambda     = "http://0.0.0.0:4566"
  }
}