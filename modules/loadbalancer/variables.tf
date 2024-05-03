variable "sg_for_alb" {
  description = "Security group for Application load balancer"
  type = list(string)
  default = []
}

variable "subnets_for_alb" {
  description = "Subnet for Application load balancer"
  type = set(string)
  default = []
}

variable "vpc_id" {
  description = "VPC id for target group"  
  type = string
  default = ""
}

variable "asg_id" {
  description = "Autoscaling group id"
  type = string
  default = ""
}

variable "tag" {
  description = "Owner/project name tag for resources"  
  type = string
  default = ""
}
