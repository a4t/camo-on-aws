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
