resource "aws_kinesis_stream" "test_stream" {
  name             = "surya-terraform-kinesis-test"
  shard_count      = 1
  retention_period = 48

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]

  tags = {
    Developer   = "surya"
    Environment = "tf_trial"
  }
}