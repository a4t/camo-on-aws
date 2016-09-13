variable vpc_id             {}
variable subnet             { default = { } }
variable sgids              { default = { } }
variable launch_config      { default = { } }
variable autoscaling        { default = { } }
variable availability_zones { default = [ ] }
variable alarm_actions      { default = [ ] }
