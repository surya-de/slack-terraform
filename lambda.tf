variable "aws_region" {
  default = "us-west-2"
}

provider "aws" {
  region          = "us-west-2"
}

data "archive_file" "lambda_zip" {
    type          = "zip"
    source_file   = "kinesis-producer-call.py"
    output_path   = "lambda_function.zip"
}

resource "aws_lambda_function" "test_lambda" {
  filename         = "lambda_function.zip"
  function_name    = "kinesis_producer"
  role             = "${aws_iam_role.kinesis_iam_for_lambda_tf.arn}"
  handler          = "lambda_handler"
  source_code_hash = "${data.archive_file.lambda_zip.output_base64sha256}"
  runtime          = "python3.6"
  timeout          = 120

   tags = {
    Developer   = "surya"
    Environment = "tf_trial"
  }
}

resource "aws_iam_role" "kinesis_iam_for_lambda_tf" {
  name = "kinesis_iam_for_lambda_tf"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}