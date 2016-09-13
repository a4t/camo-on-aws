output "sgids" {
  value = "${
    merge(
      map("app", "${aws_security_group.app.id}"),
      map("elb", "${aws_security_group.elb.id}")
    )
  }"
}

output "app" {
  value = "${
    merge(
      map("id", "${aws_security_group.app.id}"),
      map("vpc_id", "${aws_security_group.app.vpc_id}"),
      map("owner_id", "${aws_security_group.app.owner_id}"),
      map("name", "${aws_security_group.app.name}"),
      map("description", "${aws_security_group.app.description}"),
      map("ingress", "${aws_security_group.app.ingress}"),
      map("egress", "${aws_security_group.app.egress}")
    )
  }"
}

output "elb" {
  value = "${
    merge(
      map("id", "${aws_security_group.app.id}"),
      map("vpc_id", "${aws_security_group.app.vpc_id}"),
      map("owner_id", "${aws_security_group.app.owner_id}"),
      map("name", "${aws_security_group.app.name}"),
      map("description", "${aws_security_group.app.description}"),
      map("ingress", "${aws_security_group.app.ingress}"),
      map("egress", "${aws_security_group.app.egress}")
    )
  }"
}
