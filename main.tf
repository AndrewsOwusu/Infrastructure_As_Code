
# EC2 Instance in the Public Subnet
resource "aws_instance" "web_instance" {
  ami             = "ami-0c695cc059ad095e9"  # Amazon Linux 2 AMI (Update if necessary)
  instance_type   = "t3.micro"
  subnet_id       = aws_subnet.public_subnet.id
  #key_name        = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "PublicWebServer"
  }
}
