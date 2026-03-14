resource "aws_lb" "devops_alb" {
  name               = "devops-dashboard-alb"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]

  security_groups = [aws_security_group.devops_sg.id]

  tags = {
    Name = "devops-alb"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "devops-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.devops_vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.devops_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}
