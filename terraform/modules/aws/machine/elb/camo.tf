resource "aws_elb" "camo" {
  name            = "camo"
  subnets         = ["${var.subnet}"]
  security_groups = ["${var.sgids}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = "${var.health_check["healthy_threshold"]}"
    unhealthy_threshold = "${var.health_check["unhealthy_threshold"]}"
    timeout             = "${var.health_check["timeout"]}"
    target              = "${var.health_check["target"]}"
    interval            = "${var.health_check["interval"]}"
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 60
  connection_draining         = true
  connection_draining_timeout = 60

  tags {
    Name    = "camo-elb"
    Service = "camo"
    Role    = "elb"
  }
}
