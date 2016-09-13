module "route53" {
  source = "../modules/aws/route53"

  zone_id = "${var.route53["zone_id"]}"
  name    = "${var.route53["name"]}"
  alias   = {
    name                   = "${module.cloudfront.dist["domain_name"]}"
    zone_id                = "${module.cloudfront.dist["hosted_zone_id"]}"
    evaluate_target_health = "true"
  }
}
