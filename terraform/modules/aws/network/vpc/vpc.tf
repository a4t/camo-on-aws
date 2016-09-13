resource "aws_vpc" "camo" {
  cidr_block       = "${var.prefix_ip}.0/24"
  instance_tenancy = "default"

  tags {
    Name    = "camo"
    Service = "camo"
  }
}
