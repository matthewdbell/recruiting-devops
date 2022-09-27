module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs = var.vpc_azs

  # TO DO - Make this an auto assigned IP Address 
  # Couldn't get it to work!

  //map_public_ip_on_launch = true
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway
    
  tags = var.vpc_tags
}