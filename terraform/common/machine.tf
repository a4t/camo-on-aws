module "machine" {
  source = "../modules/aws/machine"

  vpc_id             = "${module.network.vpc_id}"
  subnet             = "${module.network.subnet}"
  sgids              = "${module.network.sgids}"
  availability_zones = "${var.availability_zones}"
  alarm_actions      = "${var.alarm_actions}"
  launch_config = {
    image_id                      = "${var.launch_config["image_id"]}"
    instance_type                 = "${var.launch_config["instance_type"]}"
    key_name                      = "${var.key_name}"
    associate_public_ip_address   = "${var.launch_config["associate_public_ip_address"]}"
    user_data                     = "${data.template_file.userdata.rendered}"
    root_block_device_volume_type = "${var.launch_config["root_block_device_volume_type"]}"
    root_block_device_volume_size = "${var.launch_config["root_block_device_volume_size"]}"
    iam_instance_profile          = "${module.iam.camo_ec2["name"]}"
  }
  autoscaling = {
    max_size                  = "${var.autoscaling["max_size"]}"
    min_size                  = "${var.autoscaling["min_size"]}"
    default_cooldown          = "${var.autoscaling["default_cooldown"]}"
    health_check_grace_period = "${var.autoscaling["health_check_grace_period"]}"
    health_check_type         = "${var.autoscaling["health_check_type"]}"
    force_delete              = "${var.autoscaling["force_delete"]}"
  }
}

data "template_file" "userdata" {
  template = "${file(var.launch_config["user_data_filepath"])}"

  vars {
    CAMO_KEY              = "${var.camo_key}"
    CAMO_LENGTH_LIMIT     = "${var.camo_length_limit}"
    KEYMETRICS_PUBLIC_KEY = "${var.keymetrics["public_key"]}"
    KEYMETRICS_SECRET_KEY = "${var.keymetrics["secret_key"]}"
  }
}
