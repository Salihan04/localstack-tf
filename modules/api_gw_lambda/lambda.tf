data "archive_file" "index" {
  type        = "zip"
  source_file = var.source_file
  output_path = var.output_path
}

# tfsec:ignore:aws-lambda-enable-tracing
resource "aws_lambda_function" "lambda" {
  filename         = data.archive_file.index.output_path
  function_name    = var.function_name
  role             = aws_iam_role.lambda.arn
  handler          = var.handler
  source_code_hash = filebase64sha256(data.archive_file.index.output_path)
  runtime          = var.runtime
}