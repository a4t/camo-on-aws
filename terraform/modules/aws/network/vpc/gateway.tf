resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.camo.id}"

  tags {
    Name = "camo"
  }
}
