# Generating key pair
resource "aws_key_pair" "key-tf" {
  key_name   = "key-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

# Creating instance
resource "aws_instance" "web" {
  ami                    = "ami-0aa2b7722dc1b5612"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-tf.key_name
  vpc_security_group_ids = [var.security_group_id]
  subnet_id              = var.public_subnet_id_us_east_1a

  tags = {
    Name = "terraform-first-instance"
  }
  user_data = file("${path.module}/user_data.sh")
}

# Creating ami from instance
resource "aws_ami_from_instance" "example" {
  name               = "terraform-example"
  source_instance_id = aws_instance.web.id
}


