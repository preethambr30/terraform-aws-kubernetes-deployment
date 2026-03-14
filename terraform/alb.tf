resource "aws_lb" "devops_alb" {
  name = "devops-alb"
  load_balancer_type = "application"
  subnets = [
    aws_subnet.subnet1.id,
    aws_subnet.subnet2.id
  ]
}
