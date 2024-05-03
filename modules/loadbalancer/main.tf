resource "aws_lb" "alb" {
  load_balancer_type = "application"
  security_groups    = var.sg_for_alb
  subnets            = var.subnets_for_alb
    tags = {
    Name = "${var.tag}-alb"
    Owner = "${var.tag}"
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  port = 80
  protocol = "HTTP"
  health_check {
    enabled = true
    port = 80
    protocol = "HTTP"
    path = "/"
    interval = 300
    timeout = 120
    unhealthy_threshold = 3
  }
  vpc_id = var.vpc_id
    tags = {
    Name = "${var.tag}-target-group"
    Owner = "${var.tag}"
  }
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.alb_target_group.arn
    type = "forward"
  }
}