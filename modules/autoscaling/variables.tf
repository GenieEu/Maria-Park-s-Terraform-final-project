variable "ami" {
  description = "Default AMI for instances is Ubuntu"
  type = string
  default = "ami-04b70fa74e45c3917"
}

variable "default_type" {
  description = "Default instance type is t2.micro"
  type = string
  default = "t2.micro"
}

variable "subnets_for_asg" {
  description = "Subnets for VPC zone identifier"
  type = list(string)
  default = []
}

variable "vpc_id" {
  description = "VPC id"
  type = string
  default = ""
}

variable "ingress_value" {
  description = "Ingress ports for security group"
  type = list(number)
  default = []
}

variable "egress_values" {
  description = "Egress ports for security group"
  type = list(number)
  default = []
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type = string
  default = ""
}

variable "tg_arn" {
 description = "Target group arn"  
 type = list(string)
 default = []
}

variable "tag" {
  description = "Owner/project name tag for resources"  
  type = string
  default = ""
}