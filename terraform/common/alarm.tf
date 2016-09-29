module "alarm" {
  source = "../modules/aws/alarm"

  elb           = "${module.machine.elb}"
  alarm_actions = "${var.alarm_actions}"
}
