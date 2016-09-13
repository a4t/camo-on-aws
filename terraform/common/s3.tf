module "s3" {
  source = "../modules/aws/s3"
  name   = "${var.cloudfront_log_bucket_name}"
}
