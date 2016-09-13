# Network
variable developer_ip { default = [] }
data "aws_availability_zones" "available" {}

# Domain
variable route53    { default = {} }
variable cloudfront {
  default = {
    log_bucket_name     = ""
    domain              = ""
    acm_certificate_arn = ""
  }
}

# Machine
variable alarm_actions { default = [] }

# Application
variable key_name {}
variable camo_key {}
variable keymetrics {
  default = {
    public_key = ""
    secret_key = ""
  }
}

# 最新のAMIを取得
data "aws_ami" "camo" {
  most_recent = true
  owners      = ["099720109477"] # ubuntu公式のアカウントID

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "block-device-mapping.volume-type"
    values = ["gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
