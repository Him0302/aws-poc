# Creating load balancer target group
resource "aws_lb_target_group" "my_app_eg1" {
  name       = "my-app-eg1"
  port       = 80
  protocol   = "HTTP"
  vpc_id     = var.vpc_id
  slow_start = 0
  
  load_balancing_algorithm_type = "round_robin"

  health_check {
    enabled             = true
    port                = 80
    interval            = 30
    protocol            = "HTTP"
    path                = "/"
    matcher             = "200"
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

# attaching instance to target group
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.my_app_eg1.arn
  target_id        = var.instance_id
  port             = 80
}

# Making load balancer
resource "aws_lb" "my_app_eg1" {
  name               = "my-app-eg1"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id_alb]

  # access_logs {
  #   bucket  = "my-logs"
  #   prefix  = "my-app-lb"
  #   enabled = true
  # }

  subnets = [
    var.public_subnet_id_us_east_1a,
    var.public_subnet_id_us_east_1b
  ]
}

# Creating listener
resource "aws_lb_listener" "http_eg1" {
  load_balancer_arn = aws_lb.my_app_eg1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_app_eg1.arn
  }
}


