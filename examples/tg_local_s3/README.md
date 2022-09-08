# tg_local_s3

## Starting LocalStack

Start LocalStack in detached mode (-d)

`localstack start -d`

## Testing that it work

```shell
# Provision the S3 bucket with Terraform via Terragrunt
terragrunt init
terragrunt plan
terragrunt apply

# Verify that the S3 bucket is created in LocalStack
aws --endpoint-url=http://localhost:4566 s3 ls
# Result
2022-09-08 11:41:29 localstack-bucket

# Uploading a file in the S3 bucket
touch test_file.txt
aws --endpoint-url=http://localhost:4566 s3 cp test_file.txt s3://localstack-bucket/test/test_file.txt
# Verify that the file has been uploaded
aws --endpoint-url=http://localhost:4566 s3api list-objects --bucket localstack-bucket
```

### Cleanup

```shell
# Empty the S3 bucket before deleting it
aws --endpoint-url=http://localhost:4566 s3 rm s3://localstack-bucket --recursive

terragrunt destroy
rm test_file.txt
```
