output "camo" {
  value = "${
    merge(
      map("id", "${aws_elb.camo.id}"),
      map("name", "${aws_elb.camo.name}"),
      map("dns_name", "${aws_elb.camo.dns_name}"),
      map("source_security_group", "${aws_elb.camo.source_security_group}"),
      map("source_security_group_id", "${aws_elb.camo.source_security_group_id}"),
      map("zone_id", "${aws_elb.camo.zone_id}")
    )
  }"
}
