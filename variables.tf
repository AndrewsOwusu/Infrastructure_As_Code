variable "aws_region" {
    type = string 
    default = "us-east-1"
}

### network params
variable "vpc_cidr_block" {
    description = "cidr block for the vpc"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "cidr block for public subnet"
    type        = string
    default     = "10.0.1.0/24"
}

variable "public_subnet_cidr" {
    description = "cidr block for public subnet"
    type        = string
    default     = "10.0.2.0/24"
}