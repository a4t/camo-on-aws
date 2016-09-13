resource "aws_subnet" "app" {
  vpc_id            = "${aws_vpc.camo.id}"
  cidr_block        = "${var.prefix_ip}.${element(var.app_cidr_ip, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count             = "${length(var.app_cidr_ip)}"

  tags {
    Name    = "camo-app-${element(var.availability_zones, count.index)}"
    Service = "camo"
    Role    = "app"
  }
}

resource "aws_subnet" "elb" {
  vpc_id            = "${aws_vpc.camo.id}"
  cidr_block        = "${var.prefix_ip}.${element(var.elb_cidr_ip, count.index)}"
  availability_zone = "${element(var.availability_zones, count.index)}"
  count             = "${length(var.elb_cidr_ip)}"

  tags {
    Name    = "camo-elb-${element(var.availability_zones, count.index)}"
    Service = "camo"
    Role    = "elb"
  }
}
