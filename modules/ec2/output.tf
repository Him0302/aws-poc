output "instance_id" {
  value = aws_instance.web.id
}

output "ami-id-from-instance" {
  value = aws_ami_from_instance.example.id
}

output "key-id" {
  value = aws_key_pair.key-tf.id
}


# output "key-name"{
#     value = aws_key_pair.key-tf.name
# }
