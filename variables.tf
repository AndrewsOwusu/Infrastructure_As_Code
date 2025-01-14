variable "aws_region" {
    type = string 
    default = "us-east-1"
}

### network params
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t3.micro"
}

# Variable for the number of secondary IPs and subnets
variable "secondary_private_ip_count" {
  default = 2
}

variable "secondary_private_ips" {
    description = " list of private_ips to be attached as needed"
    default = null 
}