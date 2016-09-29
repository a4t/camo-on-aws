# Network
variable developer_ip       { default = [] }
variable availability_zones { default = [] }

# Domain
variable route53                        { default = {} }
variable cloudfront_log_bucket_name     {}
variable cloudfront_domain              {}
variable cloudfront_acm_certificate_arn {}
variable cloudfront {
  default = {
    log_prefix  = "camo"
    ttl_min     = "300"
    ttl_default = "300"
    ttl_max     = "300"
  }
}

# Machine
variable launch_config {
  default = {
    image_id                      = "ami-0919cd68"
    instance_type                 = "t2.nano"
    associate_public_ip_address   = "true"
    user_data_filepath            = "../../userdatas/camo"
    root_block_device_volume_type = "gp2"
    root_block_device_volume_size = "8"
  }
}
variable autoscaling {
  default = {
    max_size                  = "0"
    min_size                  = "0"
    default_cooldown          = "300"
    health_check_grace_period = "300"
    health_check_type         = "ELB"
    force_delete              = "true"
  }
}

# Alarm
variable alarm_actions { default = [] }

# Application
variable key_name          {}
variable camo_key          {}
variable camo_length_limit { default = "10000000" }
variable keymetrics        { default = {} }
