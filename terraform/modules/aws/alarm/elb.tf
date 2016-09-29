resource "aws_cloudwatch_metric_alarm" "server_count" {
  alarm_name = "${var.elb["name"]} Healthy Host Count ${var.server_count_config["threshold"]}"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = "${var.server_count_config["evaluation_periods"]}"
  metric_name = "HealthyHostCount"
  namespace = "AWS/ELB"
  dimensions { "LoadBalancerName"="${var.elb["name"]}" }
  statistic = "Minimum"
  period = "${var.server_count_config["period"]}"
  threshold = "${var.server_count_config["threshold"]}"
  alarm_description = "${var.elb["name"]} Healthy Host Count ${var.server_count_config["threshold"]}"
  alarm_actions = [ "${var.alarm_actions}" ]
}

resource "aws_cloudwatch_metric_alarm" "http_5xx_error" {
  alarm_name = "${var.elb["name"]} 5xx error count ${var.http_5xx_error_config["threshold"]}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = "${var.http_5xx_error_config["evaluation_periods"]}"
  metric_name = "HTTPCode_Backend_5XX"
  namespace = "AWS/ELB"
  dimensions { "LoadBalancerName"="${var.elb["name"]}" }
  statistic = "Sum"
  period = "${var.http_5xx_error_config["period"]}"
  threshold = "${var.http_5xx_error_config["threshold"]}"
  alarm_description = "${var.elb["name"]} 5xx error count ${var.http_5xx_error_config["threshold"]}"
  alarm_actions = [ "${var.alarm_actions}" ]
}
