resource "aws_launch_configuration" "camo" {
  name                        = "camo"
  image_id                    = "${var.launch_config["image_id"]}"
  instance_type               = "${var.launch_config["instance_type"]}"
  security_groups             = ["${var.sgids}"]
  key_name                    = "${var.launch_config["key_name"]}"
  iam_instance_profile        = "${var.launch_config["iam_instance_profile"]}"
  associate_public_ip_address = "${var.launch_config["associate_public_ip_address"]}"
  user_data                   = "${var.launch_config["user_data"]}"
  root_block_device           = {
    volume_type = "${var.launch_config["root_block_device_volume_type"]}"
    volume_size = "${var.launch_config["root_block_device_volume_size"]}"
  }
}
