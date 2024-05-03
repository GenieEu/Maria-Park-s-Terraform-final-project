# Terraform AWS Autoscaling Group Setup

This Terraform configuration sets up an AWS Autoscaling Group along with necessary supporting resources like Launch Template and Security Group.

## Variables

- `ingress_value`: A list of ingress ports to allow traffic into the security group.
- `egress_values`: A list of egress ports to allow traffic out of the security group.
- `subnets_for_asg`: List of subnet IDs for the Autoscaling Group.
- `ami`: ID of the Amazon Machine Image (AMI) to use for instances (ubuntu).
- `default_type`: Default instance type to use for instances in the Autoscaling Group (t2.micro).
- `user_data_template`: A template for user data to be executed on instances.
- `vpc_id`: The ID of the VPC where resources will be created.
- `tg_arn`: List of Target Group ARNs for the Autoscaling Group.
- `tag`: Tag value to be used for naming resources.

## Resources

### AWS Autoscaling Group
- `vpc_zone_identifier`: List of subnet IDs for the Autoscaling Group.
- `desired_capacity_type`: Type of capacity for the Autoscaling Group.
- `desired_capacity`: Desired number of instances in the 
Autoscaling Group.
- `max_size`: Maximum number of instances in the Autoscaling Group.
- `min_size`: Minimum number of instances in the Autoscaling Group.
- `launch_template`: Configuration for launching instances in the Autoscaling Group.
- `target_group_arns`: List of Target Group ARNs for the Autoscaling Group.

### AWS Launch Template
- `image_id`: ID of the Amazon Machine Image (AMI) to use for instances.
- `instance_type`: The instance type to use for instances in the Autoscaling Group.
- `user_data`: User data to be executed on instances.
network_interfaces: Configuration for network interfaces of instances.
- `tag_specifications`: Tags to be applied to instances launched from the template.
AWS Security Group
- `vpc_id`: The ID of the VPC where the security group will be created.
- `ingress`: Configuration for allowing inbound traffic to the security group.
- `egress`: Configuration for allowing outbound traffic from the security group.
- `tags`: Tags to be applied to the security group.

## Outputs

- `main_security_group`: Security group ID created for the Autoscaling Group.
- `asg_id`: ID of the created Autoscaling Group.