output "dist" {
  value = "${
    merge(
      map("id", "${aws_cloudfront_distribution.dist.id}"),
      map("caller_reference", "${aws_cloudfront_distribution.dist.caller_reference}"),
      map("status", "${aws_cloudfront_distribution.dist.status}"),
      map("domain_name", "${aws_cloudfront_distribution.dist.domain_name}"),
      map("last_modified_time", "${aws_cloudfront_distribution.dist.last_modified_time}"),
      map("in_progress_validation_batches", "${aws_cloudfront_distribution.dist.in_progress_validation_batches}"),
      map("etag", "${aws_cloudfront_distribution.dist.etag}"),
      map("hosted_zone_id", "${aws_cloudfront_distribution.dist.hosted_zone_id}")
    )
  }"
}
