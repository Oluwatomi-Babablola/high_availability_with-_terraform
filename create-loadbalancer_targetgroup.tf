resource "aws_lb_target_group" "alb-target-group" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.custom.id

  health_check {
    protocol            = "HTTP"
    enabled             = true
    interval            = 30
    path                = "/health.html"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 5
  }
}

