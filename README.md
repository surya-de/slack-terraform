# slack-terraform
This code will create an S3 bucket, Kinesis data stream and a Lambda function required for the Slack-poc to run. It will also upload the code required for the lambda function.

## Steps to run-
Initialize the stack to download dependencies.
```bash
terraform init
```

Apply the template
```bash
terraform apply
```
