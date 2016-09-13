resource "aws_autoscaling_group" "camo" {
  name                      = "camo"
  availability_zones        = ["${var.availability_zones}"]
  load_balancers            = ["${var.camo_elb["id"]}"]
  vpc_zone_identifier       = ["${var.vpc_zone_identifier}"]
  max_size                  = "${var.autoscaling["max_size"]}"
  min_size                  = "${var.autoscaling["min_size"]}"
  default_cooldown          = "${var.autoscaling["default_cooldown"]}"
  health_check_grace_period = "${var.autoscaling["health_check_grace_period"]}"
  health_check_type         = "${var.autoscaling["health_check_type"]}"
  force_delete              = "${var.autoscaling["force_delete"]}"
  launch_configuration      = "${aws_launch_configuration.camo.name}"

  tag {
    key = "Name"
    value = "camo"
    propagate_at_launch = true
  }
  tag {
    key = "Service"
    value = "camo"
    propagate_at_launch = true
  }
  tag {
    key = "Role"
    value = "app"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_schedule" "rotate_start" {
  scheduled_action_name  = "Instance rotate start"
  min_size               = "${var.autoscaling["min_size"] + 1}"
  max_size               = "${var.autoscaling["max_size"] + 1}"
  desired_capacity       = "${var.autoscaling["max_size"] + 1}"
  recurrence             = "0 18 * * *"
  autoscaling_group_name = "${aws_autoscaling_group.camo.name}"
}

resource "aws_autoscaling_schedule" "rotate_end" {
  scheduled_action_name  = "Instance rotate end"
  min_size               = "${var.autoscaling["min_size"]}"
  max_size               = "${var.autoscaling["max_size"]}"
  desired_capacity       = "${var.autoscaling["max_size"]}"
  recurrence             = "0 19 * * *"
  autoscaling_group_name = "${aws_autoscaling_group.camo.name}"
}
