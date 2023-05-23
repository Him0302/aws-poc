variable "security_group_id" {
  type = string
}

variable "private_subnet_id_us_east_1a" {
  type = string
}

variable "instance_id" {
  default = []
}

variable "ami-id-from-instance" {
  default = []
}

variable "public_subnet_id_us_east_1a" {
  type = string
}

variable "key-id" {
  default = []
}

variable "key-name"{
    default=[]
}