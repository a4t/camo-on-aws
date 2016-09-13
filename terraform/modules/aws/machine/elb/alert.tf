resource "aws_cloudwatch_metric_alarm" "server_count" {
  alarm_name          = "${aws_elb.camo.name} Healthy Host Count ${var.alert_server_count["threshold"]}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "${var.alert_server_count["evaluation_periods"]}"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ELB"
  dimensions {
    "LoadBalancerName" ="${aws_elb.camo.name}"
  }
  statistic         = "Average"
  period            = "${var.alert_server_count["period"]}"
  threshold         = "${var.alert_server_count["threshold"]}"
  alarm_description = "${aws_elb.camo.name} Healthy Host Count ${var.alert_server_count["threshold"]}"
  alarm_actions     = ["${var.alarm_actions}"]
}
