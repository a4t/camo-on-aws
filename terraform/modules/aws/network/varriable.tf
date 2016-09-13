variable "developer_ip" { type = "list" }

variable "prefix_ip" { default = "192.168.241" }
variable "cidr_ip" {
  default = {
    "app" = [
      "0/28",
      "16/28"
    ],
    "elb" = [
      "32/28",
      "48/28"
    ]
  }
}
variable "availability_zones" { default = [ ] }
