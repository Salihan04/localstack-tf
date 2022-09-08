data "aws_iam_policy_document" "lambda_assume_role_policy_doc" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda" {
  name = "iam_for_lambda"

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy_doc.json

  tags = {
    Name = "iam_for_lambda"
  }
}