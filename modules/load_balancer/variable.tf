variable "vpc_id"{
    type=string
}

variable "instance_id" {
  type = string
}

variable "public_subnet_id_us_east_1b"{
    type=string
}

variable "public_subnet_id_us_east_1a"{
    type=string
}

variable "security_group_id_alb" {
  type = string
}


variable "target-group-arn" {
  default = []
}
