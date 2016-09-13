resource "aws_cloudfront_distribution" "dist" {
  comment     = "camo cache"
  enabled     = true
  aliases     = ["${var.cf_domain}"]
  price_class = "PriceClass_200"

  origin {
    domain_name = "${var.elb["dns_name"]}"
    origin_id   = "camo"
    origin_path = ""

    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols = [
        "TLSv1.2",
        "TLSv1.1",
        "TLSv1"
      ]
    }
  }

  logging_config {
    include_cookies = false
    bucket          = "${var.log}.s3.amazonaws.com"
    prefix          = "cloudfront"
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "camo"
    viewer_protocol_policy = "allow-all"

    forwarded_values {
      query_string = true

      cookies {
        forward = "none"
      }
    }

    min_ttl     = "${var.ttl["min"]}"
    default_ttl = "${var.ttl["default"]}"
    max_ttl     = "${var.ttl["max"]}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    ssl_support_method = "sni-only"
    acm_certificate_arn = "${var.acm_certificate_arn}"
    minimum_protocol_version = "TLSv1"
  }
}
