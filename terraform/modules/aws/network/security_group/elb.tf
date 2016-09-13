resource "aws_security_group" "elb" {
  name = "camo_elb"
  vpc_id = "${var.vpc["id"]}"
  description = "amigo elb server"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "camo-elb"
    Service = "camo"
    Role = "elb"
  }
}
