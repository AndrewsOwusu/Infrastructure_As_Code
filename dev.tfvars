## Default tags to be applied to all resources
default_tags = {
    "APP_ID"      = "111",
    "COST_CENTER" = "1244",
    "ENV"         = "dev"
}
webserver_name = "webserver.net"
webserver_simple_name = "webserver-dev"
webserver_key_name = "ansible_devops"
webserver_kms_key_arn = "arn:aws:kms:us-west-2:261265891413:key/c624b53d-952f-4a30-82cb-a7de53768d0b"
#webserver_sg = "sg-03a366e310551bbaa"

region = "us-west-2"
vpc_id = "vpc-09c6d26ae1ceac77e"
webserver_subnet_a_id = "subnet-029330b8c1f31ef5e"
webserver_subnet_b_id = "subnet-0a0a4c8e51d1581e8"

image_id = ""ami-830c94e3""
server_instance_type = "t2.micro"
#webserver_server_profile_name = "devsgroup-role"
#webserver_server_ebs_optimized = "true"
#webserver_server_root_block_size = "8"
#webserver_server_data_volume_size = "8"
#webserver_server_ingress_cidr = ["0.0.0.0/0"]
#webserver_server_ingress_rules = ["all-tcp"]
#webserver_server_egress_cidr = ["0.0.0.0/0"]
#webserver_server_egress_rules = ["all-tcp"]

#webserver_lb_subnet_a_id = ""
#webserver_lb_subnet_b_id = ""
#webserver_lb_type = "application"
#webserver_lb_deletion_protection = false
#webserver_lb_name = "webserver.healthcareit.net"
#webserver_lb_ingress_cidr = ["0.0.0.0/0"]
#webserver_lb_ingress_rules = ["all-tcp"]
#webserver_lb_egress_cidr = ["0.0.0.0/0"]
#webserver_lb_egress_rules = ["all-tcp"]
