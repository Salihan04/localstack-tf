# localstack-tf

Example repo on exploring the use of Terraform with LocalStack

## Setup

### Install tflint

```shell
brew install tflint
tflint -v

# To install the AWS tflint plugin specified in the .tflint.hcl file
tflint --init
```

### Install tfsec

```shell
brew install tfsec
tfsec -v
```

### Install LocalStack CI

`python3 -m pip install --user localstack`

### Setting up local region and credentials to run LocalStack

Configure AWS test environment variables and add the --endpoint-url=<localstack_url> flag to your aws CLI invocations. For example:

```shell
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="ap-southeast-1"

aws --endpoint-url=http://localhost:4566 <aws_service> <aws_service_action>
```

## Starting LocalStack

Start LocalStack in detached mode (-d)

`localstack start -d`
