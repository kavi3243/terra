variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.10.0.0/16"
}

variable "subnets_cidr" {
  type    = "list"
  default = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "avail_zone" {
  type    = "list"
  default = ["us-east-2a", "us-east-2b"]
}

variable "web_ami" {
  default = "ami-0d8f6eb4f641ef691"
}

variable "instance_type" {
  default = "t2.micro"
}
