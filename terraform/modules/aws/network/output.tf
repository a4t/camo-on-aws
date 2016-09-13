output "vpc_id" {
  value = "${module.vpc.vpc["id"]}"
}

output "subnet" {
  value = "${
    merge(
      map("app", "${module.vpc.subnet_app["id"]}"),
      map("elb", "${module.vpc.subnet_elb["id"]}")
    )
  }"
}

output "sgids" {
  value = "${module.security_group.sgids}"
}
