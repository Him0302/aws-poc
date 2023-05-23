# creating vpc module
module "VPC" {
  source = "./modules/vpc"
}

#creating security group
module "securitygroup" {
  source = "./modules/security_group"
  vpc_id = module.VPC.vpc_id
}

# creating ec2 instance
module "ec_2" {
  source                       = "./modules/ec2"
  security_group_id            = module.securitygroup.security_group_id
  private_subnet_id_us_east_1a = module.VPC.private_subnet_id_us_east_1a
  public_subnet_id_us_east_1a  = module.VPC.public_subnet_id_us_east_1a
}

#creating load balancer
module "loadbalancer" {
  source                      = "./modules/load_balancer"
  vpc_id                      = module.VPC.vpc_id
  instance_id                 = module.ec_2.instance_id
  public_subnet_id_us_east_1a = module.VPC.public_subnet_id_us_east_1a
  public_subnet_id_us_east_1b = module.VPC.public_subnet_id_us_east_1b
  security_group_id_alb       = module.securitygroup.security_group_id_alb
}

# creating auto scaling group
module "autoscalinggroup" {
  source                       = "./modules/auto_scaling_group"
  ami-id-from-instance         = module.ec_2.ami-id-from-instance
  security_group_id            = module.securitygroup.security_group_id
  target-group-arn             = module.loadbalancer.target-group-arn
  private_subnet_id_us_east_1a = module.VPC.private_subnet_id_us_east_1a
  private_subnet_id_us_east_1b = module.VPC.private_subnet_id_us_east_1b
}

