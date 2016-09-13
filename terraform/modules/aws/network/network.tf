module "vpc" {
  source = "./vpc"

  prefix_ip          = "${var.prefix_ip}"
  app_cidr_ip        = "${var.cidr_ip["app"]}"
  elb_cidr_ip        = "${var.cidr_ip["elb"]}"
  availability_zones = "${var.availability_zones}"
}

module "security_group" {
  source = "./security_group"

  vpc          = "${module.vpc.vpc}"
  developer_ip = "${var.developer_ip}"
}
