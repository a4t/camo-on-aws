variable subnet { default = [ ] }
variable sgids  { default = [ ] }

variable health_check {
  default = {
    healthy_threshold   = "2"
    unhealthy_threshold = "10"
    timeout             = "5"
    target              = "HTTP:80/ping"
    interval            = "30"
  }
}

variable alarm_actions { default = [] }
variable alert_server_count {
  default = {
    period             = "60"
    evaluation_periods = "1"
    threshold          = "2"
  }
}
