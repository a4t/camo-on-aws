module "network" {
  source = "../modules/aws/network"

  developer_ip       = "${var.developer_ip}"
  availability_zones = "${var.availability_zones}"
}
