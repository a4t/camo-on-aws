resource "aws_s3_bucket" "cloud_front_log" {
  bucket = "${var.name}"
  acl    = "private"

  tags {
    Name    = "camo-log"
    Service = "camo"
    Role    = "log"
  }
}
