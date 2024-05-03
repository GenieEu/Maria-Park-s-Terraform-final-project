provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "../../modules/networking"
  vpc_cidr = "16.0.0.0/16"
  public_subnets_cidr = ["16.0.1.0/24", "16.0.2.0/24","16.0.3.0/24"]
  private_subnets_cidr = ["16.0.4.0/24", "16.0.5.0/24", "16.0.6.0/24"]
  tag = "maria"
}

module "loadbalancer" {
  source = "../../modules/loadbalancer"
  sg_for_alb = [ module.autoscaling.main_security_group ]
  subnets_for_alb = module.networking.public_subnets_ids
  vpc_id = module.networking.vpc_id
  asg_id = module.autoscaling.asg_id
  tag = "maria"
}

module "autoscaling" {
  source = "../../modules/autoscaling"
  subnets_for_asg = module.networking.private_subnets_ids
  vpc_id = module.networking.vpc_id
  vpc_cidr = module.networking.vpc_cidr
  ingress_value = [ 22, 80, 443 ]
  egress_values = [ 22, 80, 443 ]
  tg_arn = [ module.loadbalancer.tg_arn ]
  tag = "maria"
}

