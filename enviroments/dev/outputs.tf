output "alb_dns_name" {
  description = "Application load balancer`s DNS name"
  value = module.loadbalancer.alb_dns_name
}