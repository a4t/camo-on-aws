output "vpc" {
  value = "${
    merge(
      map("id",                        "${aws_vpc.camo.id}"),
      map("cidr_block",                "${aws_vpc.camo.cidr_block}"),
      map("instance_tenancy",          "${aws_vpc.camo.instance_tenancy}"),
      map("enable_dns_support",        "${aws_vpc.camo.enable_dns_support}"),
      map("enable_dns_hostnames",      "${aws_vpc.camo.enable_dns_hostnames}"),
      map("enable_classiclink",        "${aws_vpc.camo.enable_classiclink}"),
      map("main_route_table_id",       "${aws_vpc.camo.main_route_table_id}"),
      map("default_network_acl_id",    "${aws_vpc.camo.default_network_acl_id}"),
      map("default_security_group_id", "${aws_vpc.camo.default_security_group_id}"),
      map("default_route_table_id",    "${aws_vpc.camo.default_route_table_id}")
    )
  }"
}

output "subnet_app" {
  value = "${
    merge(
      map("id",                "${aws_subnet.app.*.id}"),
      map("availability_zone", "${aws_subnet.app.*.availability_zone}"),
      map("cidr_block",        "${aws_subnet.app.*.cidr_block}"),
      map("vpc_id",            "${aws_subnet.app.*.vpc_id}")
    )
  }"
}

output "subnet_elb" {
  value = "${
    merge(
      map("id",                "${aws_subnet.app.*.id}"),
      map("availability_zone", "${aws_subnet.app.*.availability_zone}"),
      map("cidr_block",        "${aws_subnet.app.*.cidr_block}"),
      map("vpc_id",            "${aws_subnet.app.*.vpc_id}")
    )
  }"
}
