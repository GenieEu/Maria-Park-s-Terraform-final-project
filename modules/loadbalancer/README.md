# Terraform AWS Application Load Balancer Setup

This Terraform configuration sets up an AWS Application Load Balancer (ALB) along with necessary supporting resources like Target Group and Listener.

## Variables

- `sg_for_alb`: Security group ID to associate with the ALB.
- `subnets_for_alb`: List of subnet IDs for the ALB.
- `vpc_id`: The ID of the VPC where resources will be created.
- `tag`: Tag value to be used for naming resources.

## Resources
### AWS ALB (Application Load Balancer)

- `load_balancer_type`: Type of load balancer, in this case, "application".
- `security_groups`: Security groups associated with the ALB.
- `subnets`: Subnets where the ALB will be deployed.

### AWS ALB Target Group

- `port`: Port on which the ALB listens for traffic.
- `protocol`: Protocol used for health checks and traffic forwarding.
- `health_check`: Health check configuration for the target group.
- `vpc_id`: The ID of the VPC where the target group will be created.

### AWS ALB Listener

- `load_balancer_arn`: ARN of the ALB.
- `port`: Port on which the ALB listens for incoming traffic.
- `protocol`: Protocol used for listener.
- `default_action`: Default action configuration for the listener.

## Outputs

- `tg_arn`: ARN of the created Target Group.
- `alb_dns_name`: DNS name of the Application Load Balancer.