module "cloudfront" {
  source = "../modules/aws/cloudfront"

  elb                 = "${module.machine.elb}"
  cf_domain           = "${var.cloudfront_domain}"
  acm_certificate_arn = "${var.cloudfront_acm_certificate_arn}"
  log                 = "${var.cloudfront_log_bucket_name}"
  ttl = {
    min     = "${var.cloudfront["ttl_min"]}"
    default = "${var.cloudfront["ttl_default"]}"
    max     = "${var.cloudfront["ttl_max"]}"
  }
}
