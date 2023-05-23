#creating launch template
resource "aws_launch_template" "my_app_eg2" {
  name                   = "my-app-eg2"
  image_id               = var.ami-id-from-instance
  key_name               = "key-tf"
  vpc_security_group_ids = [var.security_group_id]
}

#creating auto scaling group
resource "aws_autoscaling_group" "my_app_eg2" {
  name     = "my-app-eg2"
  min_size = 3
  max_size = 5

  health_check_type = "EC2"

  vpc_zone_identifier = [
    var.private_subnet_id_us_east_1a,
    var.private_subnet_id_us_east_1b
  ]

  target_group_arns = [var.target-group-arn]

  mixed_instances_policy {
    launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.my_app_eg2.id
      }
      override {
        instance_type = "t2.micro"
      }
    }
  }
}

# creating auto scaling policy 
resource "aws_autoscaling_policy" "my_app_eg2" {
  name                   = "my-app-eg2"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.my_app_eg2.name

  estimated_instance_warmup = 300

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 25.0
  }
}


