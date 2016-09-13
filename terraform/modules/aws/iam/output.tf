output "camo_ec2" {
  value = "${
    merge(
      map("id", "${aws_iam_instance_profile.camo_ec2.id}"),
      map("arn", "${aws_iam_instance_profile.camo_ec2.arn}"),
      map("name", "${aws_iam_instance_profile.camo_ec2.name}"),
      map("path", "${aws_iam_instance_profile.camo_ec2.path}")
    )
  }"
}
