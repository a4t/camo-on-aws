module "elb" {
  source = "./elb"

  subnet = "${var.subnet["elb"]}"
  sgids  = [
    "${var.sgids["elb"]}"
  ]
}

module "ec2" {
  source = "./ec2"

  camo_elb            = "${module.elb.camo}"
  availability_zones  = "${var.availability_zones}"
  launch_config       = "${var.launch_config}"
  vpc_zone_identifier = "${var.subnet["app"]}"
  autoscaling         = "${var.autoscaling}"
  sgids               = [
    "${var.sgids["app"]}"
  ]
}
