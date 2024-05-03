locals {
  ingress_ports = var.ingress_value
  egress_ports = var.egress_values
}

resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnets_for_asg
  desired_capacity_type = "units"
  desired_capacity   = 2
  max_size           = 3
  min_size           = 1
  launch_template {
    id      = aws_launch_template.launch_template_for_asg.id
    version = "$Latest"
  }
  depends_on = [ aws_launch_template.launch_template_for_asg ]
  target_group_arns = var.tg_arn
}

resource "aws_launch_template" "launch_template_for_asg" {
  image_id = var.ami
  instance_type = var.default_type
  user_data = base64encode(var.user_data_template)
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.security_group.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.tag}-instance"
      Owner = "${var.tag}"
    }
  }
  depends_on = [ aws_security_group.security_group ]
}

resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id
  dynamic "ingress" {
  for_each = local.ingress_ports
    content {
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  } 
  dynamic "egress" {
  for_each = local.egress_ports
    content {
    from_port   = egress.value
    to_port     = egress.value
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # [ var.vpc_cidr ]
    }
  }
  tags = {
    Name = "${var.tag}-sg"
    Owner = "${var.tag}"
  }
}
