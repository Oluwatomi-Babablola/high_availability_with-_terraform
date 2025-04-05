resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = aws_subnet.public.*.id

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.alb-target-group.arn] # If you're connecting to a Load Balancer
  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "ASG Instance"
    propagate_at_launch = true
  }
}