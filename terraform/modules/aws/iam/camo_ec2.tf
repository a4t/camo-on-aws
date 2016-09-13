resource "aws_iam_role" "camo_ec2" {
  name               = "camo-ec2"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "camo_ec2" {
  name  = "camo-ec2"
  roles = ["${aws_iam_role.camo_ec2.name}"]
}
