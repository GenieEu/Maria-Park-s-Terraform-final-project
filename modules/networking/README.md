# Terraform AWS VPC Setup

This Terraform configuration sets up an AWS Virtual Private Cloud (VPC) along with necessary supporting resources like subnets, internet gateway, NAT gateway, and route tables.

## Variables

- `vpc_cidr`: CIDR block for the VPC.
- `public_subnets_cidr`: List of CIDR blocks for public subnets.
- `private_subnets_cidr`: List of CIDR blocks for private subnets.
- `tag`: Tag value to be used for naming resources.

## Resources

### AWS VPC

- `cidr_block`: CIDR block for the VPC.
- `enable_dns_hostnames`: Whether DNS hostnames are supported.
- `tags`: Tags to be applied to the VPC.

### AWS Subnets

#### Public Subnets

- `vpc_id`: The ID of the VPC.
- `cidr_block`: CIDR block for the subnet.
- `availability_zone`: Availability zone for the subnet.
- `map_public_ip_on_launch`: Whether instances launched in the subnet should have public IP addresses.
- `tags`: Tags to be applied to the subnet.

#### Private Subnets

- `vpc_id`: The ID of the VPC.
- `cidr_block`: CIDR block for the subnet.
- `availability_zone`: Availability zone for the subnet.
- `map_public_ip_on_launch`: Whether instances launched in the subnet should have public IP addresses.
- `tags`: Tags to be applied to the subnet.

### Internet Gateway

- `vpc_id`: The ID of the VPC.
- `tags`: Tags to be applied to the internet gateway.

### Route Tables

#### Public Route Table

- `vpc_id`: The ID of the VPC.
- `route`: Configuration for routing traffic to the internet gateway.
- `tags`: Tags to be applied to the route table.

#### Private Route Table

- `vpc_id`: The ID of the VPC.
- `route`: Configuration for routing traffic to the NAT gateway.
- `tags`: Tags to be applied to the route table.

### NAT Gateway

- `allocation_id`: The allocation ID of the Elastic IP.
- `subnet_id`: The ID of the public subnet.
- `tags`: Tags to be applied to the NAT gateway.

## Data Sources

- `AWS Availability Zones`: Data source for available availability zones.

## Outputs

- `Public Subnets IDs`: List of IDs of public subnets.

- `Private Subnets IDs`: List of IDs of private subnets.

- `VPC ID`: ID of the created Virtual Private Cloud (VPC).