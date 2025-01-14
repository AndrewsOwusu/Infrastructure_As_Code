# webserver1
resource "aws_instance" "web_instance" {
  ami             = "ami-0c695cc059ad095e9"  # Amazon Linux 2 AMI (Update if necessary)
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.public_subnet.id
  #key_name        = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "PublicWebServer_main"
  }
}

# # Data block to fetch CIDR block for each subnet defined in locals
# data "aws_subnet" "selected_subnet_0" {
#   id = local.subnet_list[0]
# }

# webserver2_and_3
resource "aws_instance" "secondary_web" {
  count           = length(local.subnet_list)
  ami             = "ami-0c695cc059ad095e9"  # Amazon Linux 2 AMI (Update if necessary)
  instance_type   = "t3.micro"
  subnet_id       = local.subnet_list[count.index]
  #key_name        = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.web_sg.id]
  #associate_public_ip_address = true

  tags = {
    Name = "PublicWebServer_${count.index}"
  }
}

# Data block to fetch CIDR block for each subnet defined in locals
data "aws_subnet" "selected_subnet_0" {
  id = local.subnet_list[0]
}

# # Secondary Network Interface without using data block
resource "aws_network_interface" "secondary_interface" {
  count           = length(local.subnet_list)
  subnet_id       = local.subnet_list[count.index]  #var.subnet_id
  security_groups = [aws_security_group.web_sg.id]  # Replace with your actual security group ID
#   private_ips_cidr_block = data.aws_subnet.selected_subnet_0.cidr_block

#   # Automatically assign secondary private IPs using the subnet_cidr_block variable directly
  private_ips = [for i in range(var.secondary_private_ip_count) : 
    cidrhost(data.aws_subnet.selected_subnet_0.cidr_block, i + 10)
  ]

### attach network interface
  attachment {
    # instance = "PublicWebServer_${count.index}"
    instance = aws_instance.secondary_web.[count.index].id
    device_index         = 1
  }

}


# ### attach network interface
#   network_interface {
#     network_interface_id = aws_network_interface.secondary_interface.id
#     device_index         = 1
#   }

# ---
# # Secondary Network Interface without using data block
# resource "aws_network_interface" "secondary_interface" {
#   subnet_id       = var.subnet_id
#   security_groups = ["sg-12345678"]  # Replace with your actual security group ID

#   # Automatically assign secondary private IPs using the subnet_cidr_block variable directly
#   private_ips = [for i in range(var.secondary_private_ip_count) : 
#     cidrhost(var.subnet_cidr_block, i + 10)
#   ]