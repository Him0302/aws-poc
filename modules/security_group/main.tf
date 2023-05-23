# Creating ec2 security group
resource "aws_security_group" "ec2_eg1" {
  name = "ec2-eg1"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80]
    iterator = port
    content {
      description     = "TLS from VPC"
      from_port       = port.value
      to_port         = port.value
      protocol        = "tcp"
      cidr_blocks     = ["0.0.0.0/0"]
      security_groups = [aws_security_group.alb_eg1.id]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

# Creating alb security group
resource "aws_security_group" "alb_eg1" {
  name = "alb-eg1"
  vpc_id = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    #vpc_security_group_ids = [var.security_group_id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
