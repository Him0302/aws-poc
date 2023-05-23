variable "vpc_id"{
    type=string
}

variable "security_group_id" {
  default = []
}

variable "security_group_id_alb" {
  default = []
}
