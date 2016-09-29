variable elb           { default = {} }
variable alarm_actions { default = [] }

variable server_count_config {
  default = {
    threshold          = 1
    evaluation_periods = 1
    period             = 60
  }
}

variable http_5xx_error_config {
  default = {
    threshold          = 100
    evaluation_periods = 3
    period             = 60
  }
}
