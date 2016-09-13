resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.camo.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name    = "camo_public"
    Service = "camo"
    Role    = "public"
  }
}


resource "aws_route_table_association" "app" {
  count          = "${length(var.app_cidr_ip)}"
  subnet_id      = "${element(aws_subnet.app.*.id, count.index%length(aws_subnet.app.*.id))}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "elb" {
  count          = "${length(var.elb_cidr_ip)}"
  subnet_id      = "${element(aws_subnet.elb.*.id, count.index%length(aws_subnet.elb.*.id))}"
  route_table_id = "${aws_route_table.public.id}"
}
