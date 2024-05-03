resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "${var.tag}-vpc"
    Owner = "${var.tag}"
  }
}

resource "aws_subnet" "public_subnets" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.public_subnets_cidr)
  cidr_block = element(var.public_subnets_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.tag}-public-subnet"
    Owner = "${var.tag}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.tag}-igw"
    Owner = "${var.tag}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.tag}-public-rt"
    Owner = "${var.tag}"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  route_table_id = aws_route_table.public_rt.id
  count = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

resource "aws_subnet" "private_subnets" {
  vpc_id = aws_vpc.vpc.id
  count = length(var.private_subnets_cidr)
  cidr_block = element(var.private_subnets_cidr, count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.tag}-public-subnet"
    Owner = "${var.tag}"
  }
}

resource "aws_eip" "eip_for_nat" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip_for_nat.id
  subnet_id = aws_subnet.public_subnets[0].id
  # depends_on = [ aws_eip.eip_for_nat, aws_subnet.public_subnets ]
  tags = {
    Name = "${var.tag}-nat"
    Owner = "${var.tag}"
  }
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
  tags = {
    Name = "${var.tag}-private-rt"
    Owner = "${var.tag}"
  }
}

resource "aws_route_table_association" "private_rt_association" {
  # depends_on = [ aws_subnet.public_subnets ]
  route_table_id = aws_route_table.private_rt.id
  count = length(var.private_subnets_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
}