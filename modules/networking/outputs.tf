output "public_subnets_ids" {
  description = "Public subnets ids"
  value = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "private_subnets_ids" {
  description = "Private subnets ids"
  value = [for subnet in aws_subnet.private_subnets : subnet.id]
}

output "vpc_id" {
  description = "VPC id"
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  description = "VPC cidr block"
  value = aws_vpc.vpc.cidr_block
}