output "main_security_group" {
  description = "Security group id"
  value = aws_security_group.security_group.id
}

output "asg_id" {
  description = "Autoscaling group id"
  value = aws_autoscaling_group.asg.id
}