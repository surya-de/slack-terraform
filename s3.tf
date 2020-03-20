resource "aws_s3_bucket" "bucket1" {
  bucket = "surya-kinesis-bucket"
  acl    = "private"

  tags = {
    Developer   = "surya"
    Environment = "tf_trial"
  }
}