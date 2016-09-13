output "cloud_front_log" {
  value = "${
    merge(
      map("id", "${aws_s3_bucket.cloud_front_log.id}"),
      map("arn", "${aws_s3_bucket.cloud_front_log.arn}"),
      map("hosted_zone_id", "${aws_s3_bucket.cloud_front_log.hosted_zone_id}"),
      map("region", "${aws_s3_bucket.cloud_front_log.region}")
    )
  }"
}
