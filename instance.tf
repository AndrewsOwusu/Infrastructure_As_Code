resource "aws_instance" "webserver" {
  ami                    = "ami-830c94e3"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["sg-07fbf74a58eb4fca2"]
  subnet_id              = "subnet-049ef96a280bf6795"
  key_name               = "ansible_devops"

}
