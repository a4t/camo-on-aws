module "common" {
  source = "../../common"

  # Network
  developer_ip       = "${var.developer_ip}"
  availability_zones = "${data.aws_availability_zones.available.names}"

  # Domain
  cloudfront_log_bucket_name     = "${var.cloudfront["log_bucket_name"]}"
  cloudfront_domain              = "${var.cloudfront["domain"]}"
  cloudfront_acm_certificate_arn = "${var.cloudfront["acm_certificate_arn"]}"
  route53                        = "${var.route53}"

  # Machine
  alarm_actions = "${var.alarm_actions}"
  launch_config = {
    image_id                      = "${data.aws_ami.camo.image_id}"
    instance_type                 = "t2.micro"
    associate_public_ip_address   = "true"
    user_data_filepath            = "../../userdatas/camo"
    root_block_device_volume_type = "gp2"
    root_block_device_volume_size = "8"
  }
  autoscaling {
    max_size                  = "2"
    min_size                  = "2"
    default_cooldown          = "300"
    health_check_grace_period = "300"
    health_check_type         = "EC2"
    force_delete              = "true"
  }

  # Application
  key_name   = "${var.key_name}"
  camo_key   = "${var.camo_key}"
  keymetrics = "${var.keymetrics}"
}
