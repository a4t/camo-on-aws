variable elb                 { default = {} }
variable cf_domain           {}
variable acm_certificate_arn {}
variable log                 {}
variable ttl {
  default = {
    min     = ""
    default = ""
    max     = ""
  }
}
