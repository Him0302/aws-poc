output "security_group_id" {
  value = aws_security_group.ec2_eg1.id
}

output "security_group_id_alb" {
  value = aws_security_group.alb_eg1.id
}