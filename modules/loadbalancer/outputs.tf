output "tg_arn" {
  description = "Target group arn"
  value = aws_lb_target_group.alb_target_group.arn
}

output "alb_dns_name" {
  description = "Application load balancer's DNS name"
  value = aws_lb.alb.dns_name
}