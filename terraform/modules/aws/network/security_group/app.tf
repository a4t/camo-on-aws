resource "aws_security_group" "app" {
  name = "camo_app"
  vpc_id = "${var.vpc["id"]}"
  description = "amigo app server"

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
    security_groups = ["${aws_security_group.elb.id}"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = "${var.developer_ip}"
  }

  tags {
    Name = "camo-app"
    Service = "camo"
    Role = "app"
  }
}
