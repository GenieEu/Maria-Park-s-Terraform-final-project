variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
  default = ""
}

variable "public_subnets_cidr" {
  description = "CIDR block for public subnets"
  type = list(string)
  default = []
}

variable "private_subnets_cidr" {
  description = "CIDR block for private subnets"
  type = list(string)
  default = []
}

variable "tag" {
  description = "Owner/project name tag for resources"  
  type = string
  default = ""
}
